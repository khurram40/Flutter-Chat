class MessagesModel{
  String ? message;
  String ? dateTime;
  String ? chatRoomId;
  String ? senderId;

  MessagesModel({this.chatRoomId,this.senderId,this.dateTime,this.message});

  Map<String ,dynamic> toJson()=>{
    'message':this.message,
    'dateTime':this.dateTime,
    'chatRoomId':this.chatRoomId,
    'senderId':this.senderId,
  };

  fromJson(dynamic parsedJson){
    this.message = parsedJson['message'] ?? '';
    this.dateTime = parsedJson['dateTime'] ?? '';
    this.chatRoomId = parsedJson['chatRoomId'] ?? '';
    this.senderId = parsedJson['senderId'] ?? '';
  }


}