import 'package:flutter/material.dart';


class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  TopContainer({this.height, this.width, this.child, this.padding});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding!=null ? padding : EdgeInsets.symmetric(horizontal: 25.0),
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(500.0),
            bottomLeft: Radius.circular(50.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
