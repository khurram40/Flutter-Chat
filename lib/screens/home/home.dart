import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_chat/animations/animations.dart';
import 'package:flutter_chat/res/commonWidgets.dart';
import 'package:flutter_chat/res/res.dart';
import 'package:flutter_chat/res/strings.dart';
import 'package:flutter_chat/res/utils.dart';
import 'package:flutter_chat/screens/home/homeProvider.dart';
import 'package:flutter_chat/screens/inbox/inbox.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController nameEditingController;
  HomeProvider homeProvider=HomeProvider();

  @override
  void initState() {
    super.initState();
    nameEditingController=TextEditingController();
    homeProvider=HomeProvider();
    homeProvider=Provider.of<HomeProvider>(context,listen: false);



  }

  @override
  Widget build(BuildContext context) {
    initializeAppResources(context: context);
    Provider.of<HomeProvider>(context,listen: true);
   return Scaffold(
     body: SafeArea(
       child:SingleChildScrollView(
         child: Container(
           height: sizes.height,
           width: sizes.width,
           child: Column(
             children: [
               SizedBox(height: getHeight()*0.10,),
               Text("Flutter Chat Demo By Khurram",),
               SizedBox(height: getHeight()*0.30,),
               CommmonWidget.getInputContainer(false, "Name", Colors.black, nameEditingController, true, Colors.black87),
               SizedBox(height: getHeight()*0.04,),
               CommmonWidget.getButton("Continue",continueButtonPress,Colors.black38, Colors.white)

               // Consumer<HomeProvider>(
               //   builder: (context,provider,child){
               //     return  ;
               //   },
               // )


             ],
           ),
         ),
       ),
     ),
   );
  }

  void continueButtonPress(){
    homeProvider.saveUser(this.context, nameEditingController.text);
}

  double getHeight() => sizes.height ?? 2560;
  double getWidth() => sizes.width ?? 1440;
}
