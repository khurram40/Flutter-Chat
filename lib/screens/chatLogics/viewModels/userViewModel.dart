import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat/res/strings.dart';
import 'package:flutter_chat/res/utils.dart';
import 'package:flutter_chat/screens/chatLogics/models/userModel.dart';

class UserViewModel extends ChangeNotifier{

  CollectionReference db = FirebaseFirestore.instance.collection('Users');

  Future<void> AddUser(User user)async{
   await db.add(user.toJson());
  }

Future <List<User>> getAllUsers()async{

    List <User> list=[];
    String  ? userId=PreferenceUtils.getString(Strings.USER_ID);
    QuerySnapshot querySanpshot=await db.where('userId', isNotEqualTo: userId).get();
    for(DocumentSnapshot documentSnapshot in querySanpshot.docs){
      User user=User();
      user.fromJson(documentSnapshot.data());
      list.add(user);
    }
    notifyListeners();
    return list;
}



}