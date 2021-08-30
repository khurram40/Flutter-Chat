import 'package:flutter/foundation.dart';
import 'package:flutter_chat/screens/chatLogics/models/messagesModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MessageViewModel extends ChangeNotifier{

  CollectionReference db = FirebaseFirestore.instance.collection('Messages');

  Future <void> sendMessage(MessagesModel messagesModel)async{
    await db.add(messagesModel.toJson());
    notifyListeners();
  }

  Future <List<MessagesModel>> getAllMessages(String chatRoomId)async{
    QuerySnapshot querySnapshot = await db.where("chatRoomId",isEqualTo: chatRoomId).orderBy('dateTime',descending: true).get();
     List <MessagesModel> list=[];
     for(DocumentSnapshot documentSnapshot in querySnapshot.docs){
       MessagesModel messagesModel=MessagesModel();
       messagesModel.fromJson(documentSnapshot.data());
       list.add(messagesModel);
     }
     notifyListeners();
     return list;
     }

}