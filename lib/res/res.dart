

import 'package:flutter/material.dart';
import 'package:flutter_chat/res/sizes.dart';
import 'package:flutter_chat/res/utils.dart';

AppSizes sizes = AppSizes();
Future<void> initializeAppResources({@required context}) async{
  sizes.initializeSize(context);
  PreferenceUtils.init();
}

