import 'package:flutter/material.dart';
import 'package:flutter_chat/animations/animations.dart';
import 'package:flutter_chat/res/res.dart';
import 'package:flutter_chat/res/strings.dart';
import 'package:flutter_chat/res/utils.dart';
import 'package:flutter_chat/screens/chatLogics/models/chatRoomModel.dart';
import 'package:flutter_chat/screens/chatLogics/models/userModel.dart';
import 'package:flutter_chat/screens/chatLogics/viewModels/chatRoomViewModel.dart';
import 'package:flutter_chat/screens/chatLogics/viewModels/userViewModel.dart';
import 'package:flutter_chat/screens/messages/messages.dart';
import 'package:provider/provider.dart';
class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  String ? myId;
  late UserViewModel userViewModel;

  @override
  void initState() {
    super.initState();
    userViewModel=UserViewModel();
    userViewModel=Provider.of<UserViewModel>(context,listen: false);
    myId=PreferenceUtils.getString(Strings.USER_ID);
  }

  @override
  Widget build(BuildContext context) {
    initializeAppResources(context: context);
    Provider.of<UserViewModel>(context,listen: true);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: sizes.height,
          width: sizes.width,
         child: FutureBuilder(
           future: userViewModel.getAllUsers(),
           builder: (context, AsyncSnapshot<List<User>>
           userSnapshot) {
             if(userSnapshot.hasData)
             return
               ListView.builder(
                   itemCount: userSnapshot.data!.length,
                   itemBuilder: (context,index){
                     return  GestureDetector(
                      onTap:(){
                        String  otherUserId=userSnapshot.data!.elementAt(index).userId!;
                        //String chatRoomId=myId!+otherUserId;
                        //ChatRoomModel chatRoomModel=ChatRoomModel(usersOneId: myId,userTwoId: otherUserId);
                        ChatRoomViewModel().CreateNewRoomBetween(userOneId: myId,userTwoId: otherUserId).then((value) {
                          Navigator.push(context, Transitions(page: Messages(
                            chatRoomId: value.chatRoomId,
                            otherUserId: otherUserId,
                            otherUserName:userSnapshot.data!.elementAt(index).name!,
                          )));
                        });
                      },

                       child: ListTile(
                         title: Text(
                             userSnapshot.data!.elementAt(index).name!
                         ),
                       ),
                     );
                   }


               );



             else
               return Center(child: Text("Loading"));
           } ,
         ),  

        ),
      ),
    );
  }
   double getHeight() => sizes.height ?? 2560;
   double getWidth() => sizes.width ?? 1440;
}
