import 'package:flutter/cupertino.dart';
import 'package:flutter_chat/animations/animations.dart';
import 'package:flutter_chat/res/strings.dart';
import 'package:flutter_chat/res/utils.dart';
import 'package:flutter_chat/screens/home/home.dart';
import 'package:flutter_chat/screens/inbox/inbox.dart';
class SplashProviders extends ChangeNotifier{
  late BuildContext context;

  init({@required BuildContext ? context}){
    this.context = context!;
    navigateToNextRoute(context);
  }


  void navigateToNextRoute(BuildContext context)async{
     await Future.delayed(Duration(seconds: 3));

     if(PreferenceUtils.getBool(Strings.IS_LOGGED_IN)??false){
      Navigator.pushReplacement(context,Transitions(page: Inbox()));
     } else{
       Navigator.pushReplacement(context,Transitions(page: Home()));
     }
   }
  }