import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_task_planner_app/dates_list.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/calendar_dates.dart';
import 'package:flutter_task_planner_app/widgets/task_container.dart';
import 'package:flutter_task_planner_app/screens/create_new_task_page.dart';
import 'package:flutter_task_planner_app/widgets/back_button.dart';


class CalendarPage extends StatelessWidget {
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '*****************************',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0,
                color: Colors.teal,
                letterSpacing: 5),
      ),
    );
  }

  static int leftDaysOfMonth(){
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0).day - now.day;
  }
  static String dateFnc() {
    return new DateFormat(' MMMM, ''yyyy' ).format(new DateTime.now());
    //DateTime.now().day.toString()+" - "+DateTime.now().month.toString() +" - "+DateTime.now().year.toString();
  }
  static int dayToWeekFnc() {
    return new DateTime.now().weekday;
    //DateTime.now().day.toString()+" - "+DateTime.now().month.toString() +" - "+DateTime.now().year.toString();
  }

  static int dayFnc() {
    return new DateTime.now().day;
    //DateTime.now().day.toString()+" - "+DateTime.now().month.toString() +" - "+DateTime.now().year.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              MyBackButton(),
              SizedBox(height: 30.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      dateFnc(),
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Raleway'
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight:  Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(50)
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewTaskPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Add task',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                ],
              ),
              SizedBox(height: 10),
              /*Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'December, 2020',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),*/
              SizedBox(height: 20.0),
              Container(
                height: 58.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: leftDaysOfMonth() + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return CalendarDates(
                      day: DateFormat('EE').format(DateTime.now().add(new Duration(days: index))),
                      date: DateFormat('dd').format(DateTime.now().add(new Duration(days: index))),
                      dayColor:
                          index == 0 ? LightColors.kRed : Colors.teal,
                      dateColor:
                      index == 0 ? LightColors.kRed :Colors.black,
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: hours.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  hours[index],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                              TaskContainer(
                                title: 'Project 1',
                                subtitle:
                                    'Discuss with the colleagues about the future plan'
                              ),
                              _dashedText(),
                              TaskContainer(
                                title: 'Meeting',
                                subtitle: '-----'
                              ),
                              TaskContainer(
                                title: 'designer new task',
                                subtitle:
                                    'Discuss with designers for new task for the app2',
                                boxColor: LightColors.kLightGreen,
                              ),
                              _dashedText(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
