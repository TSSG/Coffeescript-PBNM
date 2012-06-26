class Policy
 constructor: (@id, @mastertarget) ->
 Subject: (@subjects...) ->
 Resource: (@resources...) ->
 Action: (@actions...) ->
 Effect: (@effects) ->

   
RPSlist000 = new Policy("RPSlist.0.0.0","conference_rc");
RPSlist000.Subject(["role", "admin"])
RPSlist000.Action("read","write")
RPSlist000.Effect("permit")

RPSlist001 = new Policy("RPSlist.0.0.1","conference_rc")
RPSlist001.Subject(["role","pc-chair"])
RPSlist001.Action("read")
RPSlist001.Effect("permit")

RPSlist002 = new Policy("RPSlist.0.0.2","conference_rc")
RPSlist002.Subject(["role","pc-member"],["isMeeting", true])
RPSlist002.Action("read")
RPSlist002.Effect("permit")

RPSlist003 = new Policy("RPSlist.0.0.3","conference_rc")
RPSlist003.Effect("deny")

RPSlist100 = new Policy("RPSlist.1.0.0","conferenceInfo_rc")
RPSlist100.Action("read")
RPSlist100.Effect("permit")

RPSlist200 = new Policy("RPSlist.2.0.0","pcMember_rc")
RPSlist200.Subject(["role", "pc-member"])
RPSlist200.Action("read")
RPSlist200.Effect("permit")

RPSlist201 = new Policy("RPSlist.2.0.1","pcMember_rc")
RPSlist201.Subject(["role", "admin"])
RPSlist201.Action("create,write")
RPSlist201.Effect("permit")

RPSlist202 = new Policy("RPSlist.2.0.2","pcMember_rc")
RPSlist202.Subject(["role","pc-member"],["isEq-subjUserId-resUserId", true])
RPSlist202.Effect("deny")

RPSlist203 = new Policy("RPSlist.2.0.3","pcMember_rc")
RPSlist203.Subject(["role", "admin"])
RPSlist203.Action("delete")
RPSlist203.Effect("permit")

RPSlist300 = new Policy("RPSlist.3.0.0","pcMember-assignments_rc")
RPSlist300.Subject(["role", "pc-chair"])
RPSlist300.Action("read,write")
RPSlist300.Effect("permit")

RPSlist301 = new Policy("RPSlist.3.0.1","pcMember-assignments_rc")
RPSlist301.Subject(["role", "pc-member"],["isEq-subjUserId-resUserId", true])
RPSlist301.Action("read")
RPSlist301.Effect("permit")

RPSlist302 = new Policy("RPSlist.3.0.2","pcMember-assignments_rc")
RPSlist302.Effect("deny")

RPSlist400 = new Policy("RPSlist.4.0.0","pcMember-conflicts_rc")
RPSlist400.Subject(["role", "pc-chair"])
RPSlist400.Action("read,write")
RPSlist400.Effect("permit")

RPSlist401 = new Policy("RPSlist.4.0.1","pcMember-conflicts_rc")
RPSlist401.Subject(["role", "pc-member"],["isEq-subjUserId-resUserId", true])
RPSlist401.Action("read")
RPSlist401.Effect("permit")

RPSlist402 = new Policy("RPSlist.4.0.2","pcMember-conflicts_rc")
RPSlist402.Effect("deny")

RPSlist500 = new Policy("RPSlist.5.0.0","pcMember-assignmentCount_rc")
RPSlist500.Subject(["role", "pc-member"])
RPSlist500.Action("read")
RPSlist500.Effect("permit")

RPSlist501 = new Policy("RPSlist.5.0.1","pcMember-assignmentCount_rc")
RPSlist501.Subject(["role", "admin"])
RPSlist501.Action("write","create")
RPSlist501.Effect("permit")

RPSlist502 = new Policy("RPSlist.5.0.2","pcMember-assignmentCount_rc")
RPSlist502.Subject(["role", "pc-member"],["isEq-subjUserId-resUserId",true])
RPSlist502.Effect("deny")

RPSlist503 = new Policy("RPSlist.5.0.3","pcMember-assignmentCount_rc")
RPSlist503.Subject(["role", "admin"])
RPSlist503.Action("delete")
RPSlist503.Effect("permit")

RPSlist600 = new Policy("RPSlist.6.0.0","pcMember-info_rc")
RPSlist600.Subject(["role", "pc-chair"])
RPSlist600.Action("read","write")
RPSlist600.Effect("permit")

RPSlist601 = new Policy("RPSlist.6.0.1","pcMember-info_rc")
RPSlist601.Subject(["role", "pc-member"],["isEq-subjUserId-resUserId",true])
RPSlist601.Action("read","write")
RPSlist601.Effect("permit")

RPSlist602 = new Policy("RPSlist.6.0.2","pcMember-info_rc")
RPSlist602.Effect("deny")

RPSlist700 = new Policy("RPSlist.7.0.0","pcMember-info-password_rc")
RPSlist700.Subject(["role", "pc-member"],["isEq-subjUserId-resUserId",true])
RPSlist700.Action("write")
RPSlist700.Effect("permit")

RPSlist701 = new Policy("RPSlist.7.0.1","pcMember-info-password_rc")
RPSlist701.Subject(["role", "admin"])
RPSlist701.Resource(["isPending",false])
RPSlist701.Action("write")
RPSlist701.Effect("permit")

RPSlist702 = new Policy("RPSlist.7.0.2","pcMember-info-password_rc")
RPSlist702.Effect("deny")

RPSlist800 = new Policy("RPSlist.8.0.0","pcMember-info-isChairFlag_rc")
RPSlist800.Subject(["role", "pc-member"])
RPSlist800.Action("read")
RPSlist800.Effect("permit")

RPSlist801 = new Policy("RPSlist.8.0.1","pcMember-info-isChairFlag_rc")
RPSlist801.Subject(["role", "pc-member"],["isEq-subjUserId-resUserId",true])
RPSlist801.Effect("permit")

RPSlist802 = new Policy("RPSlist.8.0.2","pcMember-info-isChairFlag_rc")
RPSlist802.Subject(["role", "admin"])
RPSlist802.Action("write")
RPSlist802.Effect("permit")

RPSlist803 = new Policy("RPSlist.8.0.3","pcMember-info-isChairFlag_rc")
RPSlist803.Effect("deny")

RPSlist900 = new Policy("RPSlist.9.0.0","paper_rc")
RPSlist900.Subject(["role", "pc-chair"])
RPSlist900.Action("delete")
RPSlist900.Effect("permit")

RPSlist901 = new Policy("RPSlist.9.0.1","paper_rc")
RPSlist901.Subject(["role", "pc-member"])
RPSlist901.Resource(["isEq-meetingPaper-resId",true])
RPSlist901.Action("read")
RPSlist901.Effect("permit")

RPSlist902 = new Policy("RPSlist.9.0.2","paper_rc")
RPSlist902.Subject(["role", "pc-member"])
RPSlist902.Action("create")
RPSlist902.Effect("permit")

RPSlist903 = new Policy("RPSlist.9.0.3","paper_rc")
RPSlist903.Effect("deny")

RPSlist1000 = new Policy("RPSlist.10.0.0","paper-submission-info_rc")
RPSlist1000.Subject(["role", "pc-chair"],["role", "pc-member"])
RPSlist1000.Action("read")
RPSlist1000.Effect("permit")

RPSlist1001 = new Policy("RPSlist.10.0.1","paper-submission-info_rc")
RPSlist1001.Subject(["role", "subreviewer"],["isEq-subjUserId-resUserId", true])
RPSlist1001.Action("read")
RPSlist1001.Effect("permit")


RPSlist1100 = new Policy("RPSlist.11.0.0","paper-submission_rc")
RPSlist1100.Subject(["role", "pc-chair"],["role", "pc-member"])
RPSlist1100.Action("read")
RPSlist1100.Effect("permit")

RPSlist1101 = new Policy("RPSlist.11.0.1","paper-submission_rc")
RPSlist1101.Subject(["role", "subreviewer"],["isEq-subjUserId-resUserId", true])
RPSlist1101.Action("read")
RPSlist1101.Effect("permit")


RPSlist1200 = new Policy("RPSlist.12.0.0","paper-submission-file_rc")
RPSlist1200.Subject(["role", "pc-chair"],["role", "pc-member"])
RPSlist1200.Action("read")
RPSlist1200.Effect("permit")

RPSlist1201 = new Policy("RPSlist.12.0.1","paper-submission-file_rc")
RPSlist1201.Subject(["role", "subreviewer"],["isEq-subjUserId-resUserId", true])
RPSlist1201.Action("read")
RPSlist1201.Effect("permit")


RPSlist1300 = new Policy("RPSlist.13.0.0","paper-decision_rc")
RPSlist1300.Subject(["role", "pc-chair"],["isSubjectsMeeting", true])
RPSlist1300.Action("read","write")
RPSlist1300.Effect("permit")

RPSlist1400 = new Policy("RPSlist.14.0.0","paper-conflicts_rc")
RPSlist1400.Subject(["role", "admin"],["role", "pc-chair"])
RPSlist1400.Action("read","write")
RPSlist1400.Effect("permit")

RPSlist1401 = new Policy("RPSlist.14.0.1","paper-conflicts_rc")
RPSlist1401.Subject(["role", "pc-member"],["isConflicted", true])
RPSlist1401.Action("read")
RPSlist1401.Effect("permit")

RPSlist1402 = new Policy("RPSlist.14.0.2","paper-conflicts_rc")
RPSlist1402.Subject(["role", "pc-member"],["isMeeting", true])
RPSlist1402.Action("read")
RPSlist1402.Effect("permit")

RPSlist1403 = new Policy("RPSlist.14.0.3","paper-conflicts_rc")
RPSlist1403.Subject(["isConflicted", true])
RPSlist1403.Effect("deny")

RPSlist1500 = new Policy("RPSlist.15.0.0","paper-assignments_rc")
RPSlist1500.Subject(["role", "admin"],["role", "pc-chair"])
RPSlist1500.Action("read","write")
RPSlist1500.Effect("permit")

RPSlist1501 = new Policy("RPSlist.15.0.1","paper-assignments_rc")
RPSlist1501.Subject(["isConflicted", true])
RPSlist1501.Effect("deny")

RPSlist1502 = new Policy("RPSlist.15.0.2","paper-assignments_rc")
RPSlist1502.Subject(["isSubjectsMeeting", true],["role", "pc-chair"])
RPSlist1502.Resource(["isEq-meetingPaper-resId",true])
RPSlist1502.Action("read")
RPSlist1502.Effect("permit")

RPSlist1503 = new Policy("RPSlist.15.0.3","paper-assignments_rc")
RPSlist1503.Subject(["isSubjectsMeeting", true])
RPSlist1503.Action("read")
RPSlist1503.Effect("deny")

RPSlist1504 = new Policy("RPSlist.15.0.4","paper-assignments_rc")
RPSlist1504.Effect("deny")

RPSlist1600 = new Policy("RPSlist.16.0.0","paper-review_rc")
RPSlist1600.Subject(["isConflicted", true],["role", "pc-chair"])
RPSlist1600.Effect("permit")

RPSlist1601 = new Policy("RPSlist.16.0.1","paper-review_rc")
RPSlist1601.Subject(["isSubjectsMeeting", true],["role", "pc-chair"])
RPSlist1601.Resource(["isEq-meetingPaper-resId",true])
RPSlist1601.Action("read")
RPSlist1601.Effect("permit")

RPSlist1602 = new Policy("RPSlist.16.0.2","paper-review_rc")
RPSlist1602.Subject(["role", "pc-chair"])
RPSlist1602.Action("create","delete")
RPSlist1602.Effect("permit")

RPSlist1603 = new Policy("RPSlist.16.0.3","paper-review_rc")
RPSlist1603.Subject(["isConflicted", true])
RPSlist1603.Effect("deny")

RPSlist1604 = new Policy("RPSlist.16.0.4","paper-review_rc") 
RPSlist1604.Subject(["role", "pc-member"],["isConflicted",false])
RPSlist1604.Action("read")

RPSlist1604r1 = new Policy("RPSlist.16.0.4.r.1","paper-review_rc") 
RPSlist1604r1.Subject(["isEq-subjUserId-resUserId",true]);
RPSlist1604r1.Effect("permit")

RPSlist1604r2 = new Policy("RPSlist.16.0.4.r.2","paper-review_rc") 
RPSlist1604r2.Resource(["phase","discussion"]);
RPSlist1604r2.Effect("permit")

RPSlist1604r3 = new Policy("RPSlist.16.0.4.r.3","paper-review_rc") 
RPSlist1604r3.Subject(["hasSubmittedReviewForResPaper",true],["subjReviewsThisResPaper",true]);
RPSlist1604r3.Effect("permit")

RPSlist1604r4 = new Policy("RPSlist.16.0.4.r.4","paper-review_rc") 
RPSlist1604r4.Resource(["isSeeUnassignedAllowed",true]);
RPSlist1604r4.Effect("permit")

RPSlist1604r5 = new Policy("RPSlist.16.0.4.r.5","paper-review_rc") 
RPSlist1604r5.Effect("deny")


RPSlist1700 = new Policy("RPSlist.17.0.0","paper-review-info_rc")
RPSlist1700.Subject(["role", "pc-chair"])
RPSlist1700.Effect("permit")

RPSlist1800 = new Policy("RPSlist.18.0.0","paper-review-content_rc")
RPSlist1800.Subject(["isEq-subjUserId-resUserId", true],["role", "pc-member"])
RPSlist1800.Action("delete","write","create")
RPSlist1800.Effect("permit")

RPSlist1801 = new Policy("RPSlist.18.0.1","paper-review-content_rc")
RPSlist1801.Subject(["isEq-subjUserId-resUserId", true],["role", "subreviewer"])
RPSlist1801.Action("create")
RPSlist1801.Effect("permit")


RPSlist1900 = new Policy("RPSlist.19.0.0","paper-review-info-submissionStatus_rc")
RPSlist1900.Subject(["isEq-subjUserId-resUserId", true],["role", "pc-member"],["isReviewContentInPlace",true])
RPSlist1900.Action("write")
RPSlist1900.Effect("permit")

RPSlist2000 = new Policy("RPSlist.20.0.0","paper-review-content-rating_rc")
RPSlist2000.Subject(["isEq-subjUserId-resUserId", true],["role", "pc-member"])
RPSlist2000.Action("create","write","delete")
RPSlist2000.Effect("permit")

RPSlist2001 = new Policy("RPSlist.20.0.1","paper-review-content-rating_rc")
RPSlist2001.Subject(["isEq-subjUserId-resUserId", true],["role", "subreviewer"])
RPSlist2001.Action("create")
RPSlist2001.Effect("permit")


RPSlist2100 = new Policy("RPSlist.21.0.0","paper-review-content-commentsAll_rc")
RPSlist2100.Subject(["isEq-subjUserId-resUserId", true],["role", "pc-member"])
RPSlist2100.Action("create","write","delete")
RPSlist2100.Effect("permit")

RPSlist2101 = new Policy("RPSlist.21.0.1","paper-review-content-commentsAll_rc")
RPSlist2101.Subject(["isEq-subjUserId-resUserId", true],["role", "subreviewer"])
RPSlist2101.Action("create")
RPSlist2101.Effect("permit")

RPSlist2200 = new Policy("RPSlist.22.0.0","paper-review-content-commentsPc_rc")
RPSlist2200.Subject(["isEq-subjUserId-resUserId", true],["role", "pc-member"])
RPSlist2200.Action("create","write","delete")
RPSlist2200.Effect("permit")

RPSlist2201 = new Policy("RPSlist.22.0.1","paper-review-content-commentsPc_rc")
RPSlist2201.Subject(["isEq-subjUserId-resUserId", true],["role", "subreviewer"])
RPSlist2201.Action("create")
RPSlist2201.Effect("permit")

RPSlist2300 = new Policy("RPSlist.23.0.0","paper-review-info-reviewer_rc")
RPSlist2300.Subject(["role", "pc-chair"])
RPSlist2300.Effect("permit")

RPSlist2400 = new Policy("RPSlist.24.0.0","isMeetingFlag_rc")
RPSlist2400.Subject(["role", "pc-member"])
RPSlist2400.Action("read")
RPSlist2400.Effect("permit")


conference_rc = [RPSlist000,RPSlist001,RPSlist002,RPSlist003]
conferenceInfo_rc = [RPSlist100]
pcMember_rc = [RPSlist200,RPSlist201,RPSlist202,RPSlist203]
pcMember_assignments_rc = [RPSlist300,RPSlist301,RPSlist302]
pcMember_conflicts_rc = [RPSlist400,RPSlist401,RPSlist402]
pcMember_assignmentCount_rc = [RPSlist500,RPSlist501,RPSlist502,RPSlist503]
pcMember_info_rc = [RPSlist600,RPSlist601,RPSlist602]
pcMember_info_password_rc = [RPSlist700,RPSlist701,RPSlist702]
pcMember_info_isChairFlag_rc = [RPSlist800,RPSlist801,RPSlist802,RPSlist803]
paper_rc = [RPSlist900,RPSlist901,RPSlist902,RPSlist903]
paper_submission_info_rc = [RPSlist1000,RPSlist1001]
paper_submission_rc = [RPSlist1100,RPSlist1101]
paper_submission_file_rc = [RPSlist1200,RPSlist1201]
paper_decision_rc = [RPSlist1300]
paper_conflicts_rc = [RPSlist1400,RPSlist1401,RPSlist1402,RPSlist1403]
paper_assignments_rc = [RPSlist1500,RPSlist1501,RPSlist1502,RPSlist1503,RPSlist1504]
paper_review_rc = [RPSlist1600,RPSlist1601,RPSlist1602,RPSlist1603,RPSlist1604,RPSlist1604r1,RPSlist1604r2,RPSlist1604r3,RPSlist1604r4,RPSlist1604r5]
paper_review_info_rc = [RPSlist1700]
paper_review_content_rc =[RPSlist1800,RPSlist1801]
paper_review_info_submissionStatus_rc = [RPSlist1900]
paper_review_content_rating_rc = [RPSlist2000,RPSlist2001]
paper_review_content_commentsAll_rc = [RPSlist2100,RPSlist2101]
paper_review_content_commentsPc_rc = [RPSlist2200,RPSlist2201]
paper_review_info_reviewer_rc = [RPSlist2300]
isMeetingFlag_rc = [RPSlist2400]
policySet = [conferenceInfo_rc, conference_rc, isMeetingFlag_rc, paper_assignments_rc, paper_conflicts_rc, paper_decision_rc, paper_rc, paper_review_content_commentsAll_rc, paper_review_content_commentsPc_rc, paper_review_content_rating_rc, paper_review_content_rc, paper_review_info_rc, paper_review_info_reviewer_rc, paper_review_info_submissionStatus_rc, paper_review_rc, paper_submission_file_rc, paper_submission_info_rc, paper_submission_rc, pcMember_assignmentCount_rc, pcMember_assignments_rc, pcMember_conflicts_rc, pcMember_info_isChairFlag_rc, pcMember_info_password_rc, pcMember_info_rc, pcMember_rc ]

exports.conference_rc = conference_rc
exports.conferenceInfo_rc = conferenceInfo_rc
exports.pcMember_rc = pcMember_rc
exports.pcMember_assignments_rc = pcMember_assignments_rc
exports.pcMember_conflicts_rc = pcMember_conflicts_rc
exports.pcMember_assignmentCount_rc = pcMember_assignmentCount_rc
exports.pcMember_info_rc = pcMember_info_rc
exports.pcMember_info_password_rc  = pcMember_info_password_rc 
exports.pcMember_info_isChairFlag_rc = pcMember_info_isChairFlag_rc
exports.paper_rc = paper_rc 
exports.paper_submission_info_rc = paper_submission_info_rc
exports.paper_submission_rc = paper_submission_rc
exports.paper_submission_file_rc = paper_submission_file_rc
exports.paper_decision_rc = paper_decision_rc
exports.paper_conflicts_rc = paper_conflicts_rc
exports.paper_assignments_rc = paper_assignments_rc
exports.paper_review_rc = paper_review_rc
exports.paper_review_info_rc = paper_review_info_rc
exports.paper_review_content_rc = paper_review_content_rc
exports.paper_review_info_submissionStatus_rc = paper_review_info_submissionStatus_rc
exports.paper_review_content_rating_rc = paper_review_content_rating_rc 
exports.paper_review_content_commentsAll_rc = paper_review_content_commentsAll_rc
exports.paper_review_content_commentsPc_rc = paper_review_content_commentsPc_rc 
exports.paper_review_info_reviewer_rc = paper_review_info_reviewer_rc
exports.isMeetingFlag_rc = isMeetingFlag_rc
exports.policySet = policySet
exports.Policy = Policy