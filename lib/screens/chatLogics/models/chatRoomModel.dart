import 'package:uuid/uuid.dart';

class ChatRoomModel{


  List<dynamic>  userIds  = [];
  String ? chatRoomId;

  Map<String, dynamic> toJson() =>
      {
        'userIds': this.userIds,
        'chatRoomId': this.chatRoomId,
      };

  ChatRoomModel({String ? usersOneId,String ? userTwoId}){
    this.chatRoomId = chatRoomId ??= Uuid().v1();
    this.userIds.add(usersOneId);
    this.userIds.add(userTwoId);
  }

  fromJson(dynamic parsedJson) {
    this.userIds = parsedJson['userIds'] ?? '';
    this.chatRoomId = parsedJson['chatRoomId'] ?? '';
  }



}