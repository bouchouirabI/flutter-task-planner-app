import 'package:flutter/material.dart';


class TaskContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color boxColor;
  
  TaskContainer({
    this.title, this.subtitle, this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20.0),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight:  Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(50)
          )
      ),
    );
  }
}