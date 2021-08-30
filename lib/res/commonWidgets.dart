import 'package:flutter/material.dart';
import 'package:flutter_chat/res/res.dart';

class CommmonWidget{

  static Widget getInputContainer(
      bool isPassword,
      String labelText,
      Color labelColor,
      TextEditingController textEditingController,
      bool canEdit,
      Color textColor,
      ) {
    return Container(
        height: getHeight() * 0.065,
        margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
        child: TextField(
          enabled: canEdit,
          cursorHeight: 15,
          controller: textEditingController,
          obscureText: isPassword,
          textInputAction: TextInputAction.next,
          style:
          TextStyle(
              color: textColor),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            //to save us from border disappearing
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black12),
              ),
              //when the text field is not clicked
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black26),
              ),
              //when the text field is clicked
              focusedBorder: OutlineInputBorder(
                gapPadding: 2,
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black45),
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                  color: labelColor,
                  fontSize: 15,
                  fontFamily: "OpenSansRegular")),
        ));
  }


  static Widget getButton(
      String text, Function onPress, Color btnColor, Color textColor) {
    return GestureDetector(
      onTap: (){
        onPress.call();
      },
      child: Container(
        height: getHeight() * 0.07,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: getWidth() * 0.05,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          color: btnColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 16, fontFamily: "OpenSansRegular"),
          ),
        ),
      ),
    );
  }



  static double getHeight() => sizes.height ?? 2560;
  static double getWidth() => sizes.width ?? 1440;
}