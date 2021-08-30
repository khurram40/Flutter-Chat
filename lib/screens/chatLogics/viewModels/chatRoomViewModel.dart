import 'package:flutter_chat/screens/chatLogics/models/chatRoomModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatRoomViewModel{


  CollectionReference db = FirebaseFirestore.instance.collection('ChatRoom');




  // Future<ChatRoomModel> createChatRoom(ChatRoomModel chatRoomModel)async{
  //   QuerySnapshot  querySnapshot=await db.where('id',isEqualTo: chatRoomModel.id).get();
  //   if(querySnapshot.docs.isEmpty){
  //  await db.add(chatRoomModel.toJson());
  //  return chatRoomModel;
  //
  //   }else{
  // ChatRoomModel chatRoomModel=ChatRoomModel();
  // chatRoomModel.fromJson(querySnapshot.docs[0].data());
  // return chatRoomModel;
  // }
  // }

  ChatRoomModel ? _existingChatRoom;

  Future<ChatRoomModel> CreateNewRoomBetween(
      {String ? userOneId, String ? userTwoId})async{
    bool isExisting = await _isRoomAlreadyExisting(userOneId!, userTwoId!);
    if(isExisting){
      return _existingChatRoom!;
    }
    ChatRoomModel chatRoom = ChatRoomModel(usersOneId: userOneId,userTwoId: userTwoId);
    await FirebaseFirestore.instance.runTransaction((tx) async {
      await db.doc(chatRoom.chatRoomId).set(chatRoom.toJson()).whenComplete(() {
      });
    });
    return chatRoom;
  }

  Future<bool> _isRoomAlreadyExisting(String userOneId, String userTwoId) async {
    bool isExisting = false;
    QuerySnapshot documents = await db.where('userIds',arrayContains: userOneId).get();
    if(documents == null) return false;
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      for(DocumentSnapshot element in documents.docs){
        ChatRoomModel chatRoom = ChatRoomModel();
        chatRoom.fromJson(element.data());
        if(chatRoom.userIds.contains(userOneId) && chatRoom.userIds.contains(userTwoId)){
          _existingChatRoom = chatRoom;
          isExisting =  true;
          break;
        }
      }

    }).catchError((error){
      print("Error while checking duplicate chat rooms : "+ error);
      return isExisting;
    });
    return isExisting;
  }




}