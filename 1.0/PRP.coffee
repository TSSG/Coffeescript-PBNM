onRequest = (file, callback) ->
  timings = []
  timings[0] = microtime.now()
  policy = require(file)
  timings[1] = microtime.now()
  console.log "Policy successfully retrieved calling back"
  callback policy, timings
microtime = require("microtime")
exports.onRequest = onRequest
