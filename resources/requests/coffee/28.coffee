class Request 
  @subject:
    category: "access-subject"
    role : "pc-member"

  @resource:
    isSeeUnassignedAllowed: true
    id: "DEFAULT RESOURCE"

  @action:
    type: "read"
    
exports.Request = Request