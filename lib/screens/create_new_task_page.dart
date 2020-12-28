import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/back_button.dart';
import 'package:flutter_task_planner_app/widgets/my_text_field.dart';




class CreateNewTaskPage extends StatelessWidget {
  static String dateFnc() {
    return new DateFormat(' E MM  yyyy')
        .format(new DateTime.now())
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: LightColors.kGreen,
    );

    var datedIcon = Icon(
      Icons.date_range,
      color: Colors.black54,
      size: 22,

    );
    var timeIcon = Icon(
      Icons.more_time,
      color: Colors.black54,
      size: 22,
    );



    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  MyBackButton(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create new task',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w800,
                            color: LightColors.kGreen,
                            fontFamily: 'Raleway'
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyTextField(
                              label: 'Title task'
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: MyTextField(
                                  label:dateFnc(),
                                  icon: datedIcon,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: MyTextField(
                            label: 'Start Time',
                            icon: timeIcon,
                          )
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: MyTextField(
                          label: 'End Time',
                          icon: timeIcon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    label: 'Description',
                    minLines: 1,
                    maxLines: 2,
                  ),

                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                             'Projets',
                             style: TextStyle(
                             fontSize: 18,
                             color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 20),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          //direction: Axis.vertical,
                          alignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          runSpacing: 0,
                          //textDirection: TextDirection.rtl,
                          spacing: 1.0,
                          children: <Widget>[
                            Chip(
                              label: Text("Project  1"),
                              backgroundColor: Colors.pink,
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(width: 10),
                            Chip(
                              label: Text("Online Flutter Cours"),
                            ),
                            SizedBox(width: 10),
                            Chip(
                              label: Text("App 3"),
                            ),
                            SizedBox(width: 10),
                            Chip(
                              label: Text("App 2"),
                            ),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Create Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: width - 50,
                    decoration: BoxDecoration(
                      color: LightColors.kGreen,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(90),
                          topRight:  Radius.circular(90),
                          bottomLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
