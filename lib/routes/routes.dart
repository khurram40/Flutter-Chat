import 'package:flutter_chat/screens/home/home.dart';
import 'package:flutter_chat/screens/inbox/inbox.dart';
import 'package:flutter_chat/screens/messages/messages.dart';
import 'package:flutter_chat/screens/splash/splash.dart';

class Routes {
  static String splash = '/';
  static String home = '/home';
  static String inbox = '/inbox';
  static String messages = '/messages';

  static final routes = {

     home: (context) => Home(),
     inbox:(context) => Inbox(),
     splash:(context) => Splash(),
     messages:(context) => Messages(),
    // login: (context) => Login(),

  };
}
