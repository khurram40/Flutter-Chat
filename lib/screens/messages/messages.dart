import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_chat/res/strings.dart';
import 'package:flutter_chat/res/utils.dart';
import 'package:flutter_chat/screens/chatLogics/models/messagesModel.dart';
import 'package:flutter_chat/screens/chatLogics/viewModels/messagesViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
class Messages extends StatefulWidget {
  String ? otherUserId;
  String ? otherUserName;
  String ? chatRoomId;
  Messages({this.otherUserId,this.otherUserName,this.chatRoomId});

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  bool  isLoading=false;
  bool  isShowSticker=false;
  final TextEditingController textEditingController = new TextEditingController();
  final FocusNode focusNode = new FocusNode();
  late ScrollController listScrollController;
  String ? myId;

   late MessageViewModel messageViewModel;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    isShowSticker = false;
    listScrollController=new ScrollController();
    myId=PreferenceUtils.getString(Strings.USER_ID);
    messageViewModel=MessageViewModel();
    messageViewModel=Provider.of<MessageViewModel>(context,listen: false);
  }







  @override
  Widget build(BuildContext context) {
    Provider.of<MessageViewModel>(context,listen: true);
    return Scaffold(
        appBar:  AppBar(
          title: Text(
            widget.otherUserName!,
            style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: WillPopScope(
        child: Stack(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 55),
                child: buildListMessage(context)),
            // Input content
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: buildInput()),
            // Loading

          ],
        ),
        onWillPop: onBackPress,
    ),
      );
  }




  void onSendMessage(String content) {

    if (content.trim() != '') {
      textEditingController.clear();
      MessagesModel messagesModel=MessagesModel(chatRoomId: widget.chatRoomId,dateTime:(DateTime.now().toUtc()).toString(),message: content,senderId: myId);
       messageViewModel.sendMessage(messagesModel).then((value) {
       });
    } else {}
  }


  Future<bool> onBackPress() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }

    return Future.value(false);
  }




  Widget buildLoading() {
    return Positioned(
      child: isLoading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),
        ),
        color: Colors.white.withOpacity(0.8),
      )
          : Container(),
    );
  }


  Widget buildListMessage(BuildContext context) {

    return FutureBuilder(
      future: messageViewModel.getAllMessages(widget.chatRoomId!),
      builder:(context, AsyncSnapshot<List<MessagesModel>> snapshot) {
        print(snapshot.data);
        if(snapshot.hasData){
          if(snapshot.data!.length>0)
            return ListView.builder(
                itemCount: snapshot.data!.length,
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  if(snapshot.data!.elementAt(index).senderId==myId){
                    return Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(10),
                        color: Colors.black12,
                        child: Text(snapshot.data!.elementAt(index).message!,style: TextStyle(color: Colors.green),));
                  }else{
                    return Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(10),
                        color: Colors.black26,
                        child: Text(snapshot.data!.elementAt(index).message!,style: TextStyle(color: Colors.red),));
                  }

                }

            );
          return Container();

        }
        else
          return Center(child: Text("Loading"),);
      },
    );
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Edit text
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(color: Colors.red, fontSize: 15.0),
                controller: textEditingController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.blue),
                ),
                focusNode: focusNode,
              ),
            ),
          ),

          // Button send message
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => onSendMessage(textEditingController.text),
                color: Colors.yellow,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(top: new BorderSide(color: Colors.pink, width: 0.5)), color: Colors.white),
    );
  }

}
