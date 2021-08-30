import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/res/res.dart';
import 'package:flutter_chat/res/utils.dart';
import 'package:flutter_chat/screens/splash/splash_components.dart';
import 'package:flutter_chat/screens/splash/splash_providers.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 late  SplashProviders _splashProviders;
 late  SplashComponents _splashComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PreferenceUtils.init();
    _splashComponents = SplashComponents();
    _splashProviders=SplashProviders();
    _splashProviders = Provider.of<SplashProviders>(context, listen: false);
    _splashProviders.init(context: context);

  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProviders>(context, listen: true);
    initializeAppResources(context: context);
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: _splashComponents.getTitleImage()),

        ],
      ),
    );
  }
}
