import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/enums/units.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_task_planner_app/screens/calendar_page.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/task_column.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';

import '../theme/colors/light_colors.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  String _timeString;

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.calendar_today,
        size: 28.0,
        color: Colors.black,
      ),
    );
  }
  static CircleAvatar srchIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Colors.white,
      child: Icon(
          Icons.search,
          color: Colors.black,
          size: 30.0
      ),
    );
  }

  // time
  static String timeFnc() {
    return new DateFormat('h : mm : ss a').format(new DateTime.now()).toString();

  }

  static String dateFnc() {
    return new DateFormat('EEEE , MMMM , ''yyyy' ).format(new DateTime.now()).toString();
      //DateTime.now().day.toString()+" - "+DateTime.now().month.toString() +" - "+DateTime.now().year.toString();
  }

  static String weekFnc() {
    return new Jiffy().week.toString()+" weeks ";
    //DateTime.now().day.toString()+" - "+DateTime.now().month.toString() +" - "+DateTime.now().year.toString();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DateTime today = new DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 100,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.menu,
                            color: Colors.black,
                            size: 30.0),

                        Container(
                          child: Text(
                            weekFnc(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  dateFnc(),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: LightColors.kGreen,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  timeFnc(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('My Tasks'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.create_outlined,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'To Do',
                            subtitle: '1 task now',
                          ),
                          SizedBox(height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.timeline,
                             iconBackgroundColor: LightColors.kDarkYellow,
                            title: 'In Progress',
                            subtitle: '1 task now',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check,
                            iconBackgroundColor: LightColors.kGreen,
                            title: 'Done',
                            subtitle: '5 tasks now',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Projects'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kRed,
                                loadingPercent: 0.25,
                                title: 'Project 1',
                                subtitle: '9 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kGreen,
                                loadingPercent: 0.65,
                                title: 'App 2',
                                subtitle: '20 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kDarkYellow,
                                loadingPercent: 0.40,
                                title: 'App 3',
                                subtitle: '5 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kDarkBlue,
                                loadingPercent: 0.9,
                                title: 'Online Flutter Course',
                                subtitle: '20 hours progress',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
