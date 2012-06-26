PRP = require("./PRP")
microtime = require("microtime")
masterPolicy = require('./policy.coffee')
masterPolicy2 = "test"
onPEPMessage = (event, callback) ->
  timestamps = []
  timestamps[0] = microtime.now()
  PRP.onRequest "./policy.coffee", (policySet, timings) ->
   timestamps[2] = microtime.now()
   timestamps[1] = timings[1]
   callback policySet, timestamps
   
evaluate = (request, policySet, decision) ->
  timestamps = []
  timestamps[0] = microtime.now()
  masterPolicy2 = policySet
  processRequest request, (callback) ->
   timestamps[1] = microtime.now()
   processPolicy callback, (result) ->
    timestamps[2] = microtime.now()
    decision result, timestamps

processRequest = (request,callback) ->
  action = request.action.type
  subject = "test"
  resource = "test2"
  subjectCheck request.subject, (val) ->
    subject = val
  resourceCheck request.resource, (value) -> 
    resource = value
  callback([subject,resource,action])
      
subjectCheck = (subject,callback) ->
  cb = []
  i = 0
  
  unless subject.subjReviewsThisResPaper is `undefined`
   cb[i] = ["subjReviewsThisResPaper", subject.subjReviewsThisResPaper]
   i++
  
  if subject['isEq-subjUserId-resUserId'] is true
   cb[i] = ['isEq-subjUserId-resUserId',subject['isEq-subjUserId-resUserId']]
   i++
  
  unless subject.isConflicted is `undefined`
   cb[i] = ["isConflicted", subject.isConflicted]
   i++
    
  unless subject.role is `undefined`
   cb[i] = ["role", subject.role]
   i++
    
  unless subject.isMeeting is `undefined`
   cb[i] = ["isMeeting", subject.isMeeting]
   i++
    
  unless subject.isSubjectsMeeting is `undefined`
   cb[i] = ["isSubjectsMeeting", subject.isSubjectsMeeting]
   i++
  
  callback(cb);
  
resourceCheck = (resource, callback) ->
  unless resource.isPending is `undefined`
   callback(["isPending",resource.isPending])
  unless resource.phase is `undefined`
   callback(["phase",resource.phase])
  unless resource.isSeeUnassignedAllowed is `undefined`
   callback(["isSeeUnassignedAllowed",resource.isSeeUnassignedAllowed])
  unless resource.class is `undefined`
   callback(["class",resource.class])
  unless resource['isEq-meetingPaper-resId'] is `undefined`
   callback(["isEq-meetingPaper-resId",resource['isEq-meetingPaper-resId']])
 

processPolicy = (request,callback) ->
 identify_policySet request, (workingSet) ->
  if workingSet is "NotApplicable" then callback("NotApplicable")
  else
   makeDecision request,workingSet,(decision) ->
    callback(decision)
 
makeDecision = (request, policySet, decision) ->
  action = request[2]
  subject = request[0][0]
  resource = request[1]
  notApp = false
  oneDeny = false
  specialCase = false
  for policy in policySet
   if specialCase is true
    break
   subjectMatch = false
   actionMatch = false
   hasExtraRes = false # for when an additional resource is present
   effect = "tempDeny"
   correctSubjectWrongAnswer = false
   subjectNotApplicable = false
   specialSubjectMatch = false
   endOfTheLine = false
   undef = false
   undefSwitch = false # silly switch to make sure undef doesn't get flipped
   noAct = false # we have no actions if this is true
   if policy.subjects is `undefined`
    if policy.actions is `undefined`
     if policy.resources is `undefined` and specialCase is false
      oneDeny = false # reset
      notApp = false # reset
      specialCase = true
      endOfTheLine = true
      decision(policy.effects)
    else
      for act in policy.actions
        if action is act
         actionMatch = true
         specialCase = true
         oneDeny = false # reset
         notApp = false # reset
         decision(policy.effects)
         break
   else
     if policy.actions is `undefined`
      noAct = true # but we have a subject though
     if policy.resources isnt `undefined` and specialCase is false
      if resource[0] is "class"
       hasExtraRes = true
       specialCase = true
       decision("deny")
       break
     for sub in policy.subjects
      if subject[0] is sub[0] and subject[1] is sub[1]
       subjectMatch = true
       undefSwitch = true # just in case we turn it off by accident
       undef = false
      else
       if subject[0] is sub[0]
        undef = true
        specialSubjectMatch = true # cause technically its the right subject role
       else
        undef = true # get outta dodge
        subjectNotApplicable = true
      if noAct is true and subjectMatch is true
       specialCase = true
       oneDeny = false
       notApp = false
       decision(policy.effects)
       break
      if noAct is false and undef is false
       for act in policy.actions
        if action is act
         actionMatch = true
         specialCase = true
         oneDeny = false # reset
         notApp = false # reset
         decision(policy.effects)
         break
        else
         oneDeny = true # right subject wrong action
  
   if subjectMatch is true and actionMatch is false and specialCase is false
    oneDeny = true # Deny Overridees because you tried the wrong thing
   if subjectMatch is false and specialCase is false
    notApp = true # No clue who you are so not allowing you access
   if specialSubjectMatch is true
    oneDeny = true # Deny because you had the right role but weren't the right person

  if specialCase is false
   if oneDeny is true
    if notApp is true
     decision("deny") # Deny Overrides
    else
      decision("deny") # Deny cause NotApp is false
   else if notApp is true
    decision("NotApplicable") # No Denys so you are not applicable

identify_policySet = (request,callback) ->
 action = request[2]
 subject = request[0]
 res_type = request[1][0]
 res_val = request[1][1]
 reply = []
 if res_type is "class"
  target = masterPolicy[res_val]
  if target is `undefined`
   callback('NotApplicable')
  else
   callback(target)
 else
  findPolicy res_type,(cb) ->
   callback(cb)
  

findPolicy = (keyword,callback) ->
 found = []  
 for policy in masterPolicy.policySet
  for p in policy when p.resources isnt `undefined`
   if(p.resources[0][0] is keyword)
    found.push(p)
 callback(found)   
 
exports.onPEPMessage = onPEPMessage
exports.evaluate = evaluate;