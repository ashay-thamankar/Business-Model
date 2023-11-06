import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';
import 'notefy.dart';
import 'package:krishi_mitra/my_flutter_app_icons.dart';
import './controlpage.dart' as firstpage;
import './userinfo.dart' as secondpage;

bool control = true;

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> with SingleTickerProviderStateMixin {
  TabController controller;
//  void name() {
//    ListView(
//      children: [
//        ListTile(
//          onTap: () {
//            String url2 = "http:/www.agricoop.nic.in";
//            launch(url2);
//          },
//          title: Text('News & Information'),
//        ),
//        ListTile(
//          onTap: () {
//            Navigator.of(context).pop();
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (BuildContext context) => notify()));
//          },
//          title: Text('Notification'),
//        ),
//        ListTile(
//          onTap: () {},
//          title: Text('Marketing'),
//        ),
//        ListTile(
//          onTap: () {},
//          title: Text('Help & Feedback'),
//        ),
//        ListTile(
//          title: Text('About'),
//          onTap: () {
//            Navigator.of(context).pop();
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (BuildContext context) => aboutPage()));
//          },
//        ),
//      ],
//    );
//  }
//  SmsSender sender = SmsSender();
//  String address = "9740809315";
//
//  SmsMessage message = SmsMessage(address, 'Hello flutter!');
//  message.onStateChanged.listen((state) {
//  if (state == SmsMessageState.Sent) {
//  print("SMS is sent!");
//  } else if (state == SmsMessageState.Delivered) {
//  print("SMS is delivered!");
//  }
//  });
//  sender.sendSms(message);

  Widget popupMenuButton() {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        size: 20.0,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "First",
          child: PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("English"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Hindi"),
              ),
              PopupMenuItem(
                value: 3,
                child: Text("Kannada"),
              ),
            ],
            child: Text('Language'),
          ),
        ),
      ],
    );
  }

  IconData icoon = MyFlutterApp.speaker_notes;
  void changeIcon() {
    if (icoon == MyFlutterApp.speaker_notes_off) {
      icoon = MyFlutterApp.speaker_notes;
      control = true;
    } else {
      icoon = MyFlutterApp.speaker_notes_off;
      control = false;
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Center(
            child: Text(
              'Krishi Mitra',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  changeIcon();
                });
              },
              icon: Icon(
                icoon,
                color: Colors.black,
              ),
            ),
            popupMenuButton(),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: controller,
          tabs: [
            Tab(
                icon: Icon(
              Icons.home,
            )),
            Tab(
                icon: Icon(
              Icons.account_box,
            )),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.green[400],
                  Colors.lightGreen[400],
                  ])
                ),
                child: Container(
                  child: Column(
                    children: [
                      Material(
//                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: Image.asset('images/logo.jpg',
                            width: 100.0, height: 100.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Hello',
                        style: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  String url2 = "http:/www.agricoop.nic.in";
                  launch(url2);
                },
                title: Text('News & Information'),
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => notify()));
                },
                title: Text('Notification'),
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                onTap: () {
                  String url4 = "https://enam.gov.in/web/";
                  launch(url4);
                },
                title: Text('Marketing'),
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => feedBack()));
                },
                title: Text('Help & Feedback'),
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => aboutPage()));
                },
              ),
              Divider(
                color: Colors.black54,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            firstpage.InputData(),
            secondpage.UserInfo(),
          ],
        ),
      ),
    );
  }
}
