import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class notify extends StatefulWidget {
  @override
  _notifyState createState() => _notifyState();
}

class _notifyState extends State<notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              ListTile(
                title: Text('Timer Notification'),
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                onTap: () {
                  String url3 =
                      "https://www.canr.msu.edu/news/signs_and_symptoms_of_plant_disease_is_it_fungal_viral_or_bacterial";
                  launch(url3);
                },
                title: Text('Diseases to Plants'),
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                title: Text('Motor Free Run'),
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                title: Text('Current Supply Status'),
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                title: Text('Others'),
              ),
              Divider(
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class feedBack extends StatefulWidget {
  @override
  _feedBackState createState() => _feedBackState();
}

class _feedBackState extends State<feedBack> {
  String feedbac;
  String msg = 'default';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help and Feedback',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kindly Write Your Feedback Here',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Feedback',
                  ),
                  onChanged: (String str){
                    feedbac = str;
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.lightGreen,
                onPressed: (){
                  setState(() {
                    msg= feedbac;
                    String url5 =
                        "mailto:<ashaythamankar@gmail.com>?subject=FeedBack&body=<$msg>";
                    launch(url5);
                  });
                },
                child: Text('Send',
                style: TextStyle(
                  fontSize: 20.0,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
