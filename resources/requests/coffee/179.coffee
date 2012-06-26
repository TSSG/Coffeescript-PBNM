class Request 
  @subject:
    category: "access-subject"
    "isEq-subjUserId-resUserId": true

  @resource:
    "isEq-meetingPaper-resId": true
    id: "DEFAULT RESOURCE"

  @action:
    type: "read"
    
exports.Request = Request