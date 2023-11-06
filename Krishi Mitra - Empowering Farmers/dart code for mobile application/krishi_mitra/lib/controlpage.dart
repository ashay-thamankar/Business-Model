import 'package:flutter/material.dart';
import 'package:krishi_mitra/timer.dart';
import 'color.dart';
import 'package:sms/sms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {

  FlutterLocalNotificationsPlugin fltrNotification;

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

  sendSms() {
    String sms1 = "sms:9740809315";
    launch(sms1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            changeColor(1);
                            if(control == true && control1 ==true){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Happy');
                              sender.sendSms(message);
                              message.onStateChanged.listen((state) {
                                if (state == SmsMessageState.Sent) {
                                  print('message sent');
                                } else if (state == SmsMessageState.Delivered) {
                                  showNotification();
                                }
                              });
                            }
                            if(control == true && control1 ==false){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Sad');
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
                        },
                        child: ReusableCard(
                          colour: c1,
                          cardChild: Center(
                            child: Text('Motor',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Rename"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Timer Mode"),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text("Auto Mode"),
                            ),
                            PopupMenuItem(
                              value: 4,
                              child: Text("On/Off Code"),
                            ),
                          ],
                          onSelected: (value){
                            if(value == 2){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => TimerPage(msg1: 'Happy', msg2: 'Sad')));
                            }
                        },
                          child: Icon(
                            Icons.more_vert,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            changeColor(2);
                            if(control == true && control1 ==true){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Long');
                              sender.sendSms(message);
                              message.onStateChanged.listen((state) {
                                if (state == SmsMessageState.Sent) {
                                  print('message sent');
                                } else if (state == SmsMessageState.Delivered) {
                                  showNotification();
                                }
                              });
                            }
                            if(control == true && control1 ==false){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Short');
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
                        },
                        child: ReusableCard(
                          colour: c2,
                          cardChild: Center(
                            child: Text('Lane-1',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Rename"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Timer Mode"),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text("Auto Mode"),
                            ),
                            PopupMenuItem(
                              value: 4,
                              child: Text("On/Off Code"),
                            ),
                          ],
                          onSelected: (value){
                            if(value == 2){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => TimerPage(msg1: 'Long', msg2: 'Short')));
                            }
                          },
                          child: Icon(
                            Icons.more_vert,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            changeColor(3);
                            if(control == true && control1 ==true){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Thick');
                              sender.sendSms(message);
                              message.onStateChanged.listen((state) {
                                if (state == SmsMessageState.Sent) {
                                  print('message sent');
                                } else if (state == SmsMessageState.Delivered) {
                                  showNotification();
                                }
                              });
                            }
                            if(control == true && control1 ==false){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Thin');
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
                        },
                        child: ReusableCard(
                          colour: c3,
                          cardChild: Center(
                            child: Text('Lane-2',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Rename"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Timer Mode"),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text("Auto Mode"),
                            ),
                            PopupMenuItem(
                              value: 4,
                              child: Text("On/Off Code"),
                            ),
                          ],
                          onSelected: (value){
                            if(value == 2){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => TimerPage(msg1: 'Thick', msg2: 'Thin')));
                            }
                          },
                          child: Icon(
                            Icons.more_vert,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            changeColor(4);
                            if(control == true && control1 ==true){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Speed');
                              sender.sendSms(message);
                              message.onStateChanged.listen((state) {
                                if (state == SmsMessageState.Sent) {
                                  print('message sent');
                                } else if (state == SmsMessageState.Delivered) {
                                  showNotification();
                                }
                              });
                            }
                            if(control == true && control1 ==false){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Slow');
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
                        },
                        child: ReusableCard(
                          colour: c4,
                          cardChild:  Center(
                            child: Text('Lane-3',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Rename"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Timer Mode"),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text("Auto Mode"),
                            ),
                            PopupMenuItem(
                              value: 4,
                              child: Text("On/Off Code"),
                            ),
                          ],
                          onSelected: (value){
                            if(value == 2){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => TimerPage(msg1: 'Speed', msg2: 'Slow')));
                            }
                          },
                          child: Icon(
                            Icons.more_vert,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            changeColor(5);
                            if(control == true && control1 ==true){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Hi');
                              sender.sendSms(message);
                              message.onStateChanged.listen((state) {
                                if (state == SmsMessageState.Sent) {
                                  print('message sent');
                                } else if (state == SmsMessageState.Delivered) {
                                  showNotification();
                                }
                              });
                            }
                            if(control == true && control1 ==false){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'Hello');
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
                        },
                        child: ReusableCard(
                          colour: c5,
                          cardChild: Center(
                            child: Text('Lane-4',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Rename"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Timer Mode"),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text("Auto Mode"),
                            ),
                            PopupMenuItem(
                              value: 4,
                              child: Text("On/Off Code"),
                            ),
                          ],
                          onSelected: (value){
                            if(value == 2){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => TimerPage(msg1: 'Hi', msg2: 'Hello')));
                            }
                          },
                          child: Icon(
                            Icons.more_vert,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            changeColor(6);
                            if(control == true && control1 ==true){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'sixon');
                              sender.sendSms(message);
                              message.onStateChanged.listen((state) {
                                if (state == SmsMessageState.Sent) {
                                  print('message sent');
                                } else if (state == SmsMessageState.Delivered) {
                                  showNotification();
                                }
                              });
                            }
                            if(control == true && control1 ==false){
                              SmsSender sender = SmsSender();
                              String address = "9740809315";
                              SmsMessage message = SmsMessage(address, 'sixoff');
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
                        },
                        child: ReusableCard(
                          colour: c6,
                          cardChild: Center(
                            child: Text('Lane-5',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Rename"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Timer Mode"),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text("Auto Mode"),
                            ),
                            PopupMenuItem(
                              value: 4,
                              child: Text("On/Off Code"),
                            ),
                          ],
                          onSelected: (value){
                            if(value == 2){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => TimerPage(msg1: 'sixon', msg2: 'sixoff')));
                            }
                          },
                          child: Icon(
                            Icons.more_vert,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            String no = "tel:+919741040757";
                            launch(no);
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                size: 40.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Call',
                                style: TextStyle(
                                  fontSize: 27.0,
                                ),)
                            ],
                          ),
                          margin: EdgeInsets.all(10.0),
                          height: 100.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            color: Color(0xfff2ffe6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Rename"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Change Number"),
                            ),
                          ],
                          child: Icon(
                            Icons.more_vert,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          String url1 = "http:/192.168.1.1";
                          launch(url1);
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wifi,
                                size: 40.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Wi-Fi',
                                style: TextStyle(
                                  fontSize: 27.0,
                                ),)
                            ],
                          ),
                          margin: EdgeInsets.all(10.0),
                          height: 100.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            color: Color(0xfff2ffe6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text("Rename"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("Change IP address"),
                            ),
                          ],
                          child: Icon(
                            Icons.more_vert,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future notificationSelected(String payload) async{
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      height: 140.0,
      width: 170.0,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}