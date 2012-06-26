Array::shuffle = -> @sort -> 0.5 - Math.random()





PDP = require("./PDP")
PRP = require("./PRP")
microtime = require("microtime")
events = require("events")
eventEmitter = new events.EventEmitter()

start = "./resources/"
resource = 1
end = ".coffee"
skip = false
excludes = [6,29,51,71,91,111,125,135,178,180]
masterPolicy = 'undefined'
replication = 0
running = true

eventEmitter.on "policy", (msg) ->
  console.log "Request received to load in the policy set"
  PDP.onPEPMessage "./policy.coffee", (policySet, callback) ->
   console.log "Received callback timings"
   console.log callback[0]
   console.log callback[1]
   console.log callback[2]
   x = callback[2] - callback[0]
   console.log "0,0,PolicySetLoaded," + x
   masterPolicy = policySet


eventEmitter.on "request", (msg) ->
  for num in [1..100] # replication
   requestSet = [1..200].shuffle()
   for resource in requestSet
    path = start + resource + end
    timestamps = []
    request = require(path).Request
    timestamps[0] = microtime.now()
    PDP.evaluate request,masterPolicy, (response, timing) ->
      total_eval_time = timing[2] - timestamps[0]
      console.log resource + "," + num + "," + response + "," + total_eval_time
  
setTimeout (->
  eventEmitter.emit "policy", "start"
), 2000

  
setTimeout (->
  eventEmitter.emit "request", "start"
), 6000