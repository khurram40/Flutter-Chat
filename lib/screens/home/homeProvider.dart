
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/animations/animations.dart';
import 'package:flutter_chat/res/myToast.dart';
import 'package:flutter_chat/res/strings.dart';
import 'package:flutter_chat/res/utils.dart';
import 'package:flutter_chat/screens/chatLogics/models/userModel.dart';
import 'package:flutter_chat/screens/chatLogics/viewModels/userViewModel.dart';
import 'package:flutter_chat/screens/inbox/inbox.dart';
import 'package:uuid/uuid.dart';
class HomeProvider extends ChangeNotifier{

Future <void> saveUser(BuildContext context,String name)async{
if(name.isNotEmpty){
  String userId=Uuid().v1();
  User user=User(name: name,userId: userId);
  UserViewModel().AddUser(user).then((_){
    ApplicationToast.getSuccessToast(durationTime: 3, heading: "Welcome");
    PreferenceUtils.setString(Strings.USER_ID, userId);
    PreferenceUtils.setString(Strings.USER_NAME, name);
    PreferenceUtils.setBool(Strings.IS_LOGGED_IN, true);
    Navigator.pushReplacement(context,Transitions(page: Inbox()));
  });

}else{
ApplicationToast.getErrorToast(durationTime: 2, heading: "Please enter name");
}


}


}