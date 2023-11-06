import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';
import 'home.dart';
import 'package:sms/sms.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class TimerPage extends StatefulWidget {
  String msg1;
  String msg2;
  TimerPage({ this.msg1,  this.msg2});
  @override
  _TimerPageState createState() => _TimerPageState(msg1: msg1, msg2: msg2);
}

class _TimerPageState extends State<TimerPage> {
  String msg1;
  String msg2;
  _TimerPageState({ this.msg1,  this.msg2});
  @override
  void initState(){
    super.initState();
    var androidInitialize = AndroidInitializationSettings('app_icon');
    var iOSinitialize = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(androidInitialize, iOSinitialize);
    fltrNotification = FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initializationSettings,
        onSelectNotification: notificationSelected);
  }


  Future showNotification() async{
    var androidDetails = AndroidNotificationDetails('Channel ID', 'Krishi-Mitra', 'User Friendly Application', importance: Importance.Max);
    var iSODetails = IOSNotificationDetails();
    var generalNotificationDetails = NotificationDetails(androidDetails, iSODetails);

    await fltrNotification.show(0, "Acknowledgement", "Message received by GSM Module", generalNotificationDetails);
  }
  FlutterLocalNotificationsPlugin fltrNotification;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timetodisplay = '';
  bool checktimer = true;
  bool confirm = true;
  void start(){
    setState(() {
      started =false;
      stopped = false;
      if(control == true ){
        SmsSender sender = SmsSender();
        String address = "9740809315";
        SmsMessage message = SmsMessage(address, msg1);
        sender.sendSms(message);
        message.onStateChanged.listen((state) {
          if (state == SmsMessageState.Sent) {
            print('message sent');
          } else if (state == SmsMessageState.Delivered) {
            showNotification();
          }
        });
      }
    });
    timeForTimer=((hour * 60 * 60) + (min * 60) + sec);
    Timer.periodic(Duration(
      seconds: 1,
    ), (Timer t) {
      setState(() {
        if(timeForTimer < 1 || checktimer == false){
          t.cancel();
          if(timeForTimer == 0){
            if(control == true ){
              SmsSender sender = SmsSender();
              String address = "9482076935";
              SmsMessage message = SmsMessage(address, msg2);
              sender.sendSms(message);
              message.onStateChanged.listen((state) {
                if (state == SmsMessageState.Sent) {
                  print('message sent');
                } else if (state == SmsMessageState.Delivered) {
                  showNotification();
                }
              });
            }
            print('stopped by default');
          }else{
            if(control == true){
              SmsSender sender = SmsSender();
              String address = "9740809315";
              SmsMessage message = SmsMessage(address, msg2);
              sender.sendSms(message);
              message.onStateChanged.listen((state) {
                if (state == SmsMessageState.Sent) {
                  print('message sent');
                } else if (state == SmsMessageState.Delivered) {
                  showNotification();
                }
              });
            }
            print('stopped by user');
          }
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => TimerPage(),
          ));
        }
        else if(timeForTimer < 60){
          timetodisplay = timeForTimer.toString();
          timeForTimer = timeForTimer - 1;
        } else if (timeForTimer< 3600){
          int m = timeForTimer ~/60;
          int s = timeForTimer - (60 * m);
          timetodisplay = m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;
        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          timetodisplay = h.toString() + ":" + m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer -1;
        }
      });
    });
  }
  void stop(){
    setState(() {
      started = true;
      stopped = true;
      checktimer= false;
    });
  }
  int hour = 0;
  int min = 0;
  int sec = 0;
  Widget timer() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          'HH',
                        ),
                      ),
                      NumberPicker.integer(
                          initialValue: hour,
                          minValue: 0,
                          maxValue: 23,
                          onChanged: (val) {
                            setState(() {
                              hour = val;
                            });
                          }
                          )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          'MM',
                        ),
                      ),
                      NumberPicker.integer(
                          initialValue: min,
                          minValue: 0,
                          maxValue: 59,
                          onChanged: (val) {
                            setState(() {
                              min = val;
                            });
                          }
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          'SS',
                        ),
                      ),
                      NumberPicker.integer(
                          initialValue: sec,
                          minValue: 0,
                          maxValue: 59,
                          onChanged: (val) {
                            setState(() {
                              sec = val;
                            });
                          }
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(timetodisplay,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: started ? start : null,
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    color: Colors.green,
                    child: Text('Start',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  RaisedButton(
                    onPressed: stopped ? null : stop,
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    color: Colors.red,
                    child: Text('Stop',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: timer(),
    );
  }
  Future notificationSelected(String payload) async{
  }
}
