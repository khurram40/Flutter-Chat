import 'package:flutter/cupertino.dart';

class Transitions extends PageRouteBuilder {
  final Widget ? page;

  Transitions({this.page})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page!,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
            //for now
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}
