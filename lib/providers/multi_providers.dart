
import 'package:flutter_chat/screens/chatLogics/viewModels/messagesViewModel.dart';
import 'package:flutter_chat/screens/chatLogics/viewModels/userViewModel.dart';
import 'package:flutter_chat/screens/home/homeProvider.dart';
import 'package:flutter_chat/screens/splash/splash_providers.dart';
import 'package:provider/provider.dart';

final multiProviders = [
  ChangeNotifierProvider<HomeProvider>(
    create: (_) => HomeProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SplashProviders>(
    create: (_) => SplashProviders(),
    lazy: true,
  ), ChangeNotifierProvider<MessageViewModel>(
    create: (_) => MessageViewModel(),
    lazy: true,
  ), ChangeNotifierProvider<UserViewModel>(
    create: (_) => UserViewModel(),
    lazy: true,
  ),

];
