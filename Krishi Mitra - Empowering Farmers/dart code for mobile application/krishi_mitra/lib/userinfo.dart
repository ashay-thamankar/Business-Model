import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi_mitra/dbmanager.dart';
import 'dbmanager.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final DbStudentManager dbmanager = new DbStudentManager();

  final _nameController = TextEditingController();
  final _courseController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  Student student;
  List<Student> studlist;
  int updateIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Farmer Info'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Farmer Name',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Farmer name',
                    ),
                    controller: _nameController,
                    validator: (val) =>
                        val.isNotEmpty ? null : 'Name Should Not Be empty',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Farmer GSM Number',
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Farmer GSM name',
                    ),
                    controller: _courseController,
                    validator: (val) =>
                        val.isNotEmpty ? null : 'Course Should Not Be empty',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    color: Colors.lightGreen,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      _submitStudent(context);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FutureBuilder(
                    future: dbmanager.getStudentList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        studlist = snapshot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: studlist == null ? 0 : studlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            Student st = studlist[index];
                            return Card(
                              color: Colors.lightGreen[400],
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '   Name: ${st.name}',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '   GSM Number: ${st.course}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _nameController.text = st.name;
                                      _courseController.text = st.course;
                                      student = st;
                                      updateIndex = index;
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      dbmanager.deleteStudent(st.id);
                                      setState(() {
                                        studlist.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.black54,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return new CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitStudent(BuildContext context) {
    if (_formKey.currentState.validate()) {
      if (student == null) {
        Student st = new Student(
            name: _nameController.text, course: _courseController.text);
        dbmanager.insertStudent(st).then((id) => {
              _nameController.clear(),
              _courseController.clear(),
              print('Student Added to Db $id')
            });
      } else {
        student.name = _nameController.text;
        student.course = _courseController.text;

        dbmanager.updateStudent(student).then((id) => {
              setState(() {
                studlist[updateIndex].name = _nameController.text;
                studlist[updateIndex].course = _courseController.text;
              }),
              _nameController.clear(),
              _courseController.clear(),
              student = null
            });
      }
    }
  }
//  showAlert(BuildContext context) {
//    return showDialog(context: context,
//    builder: (context) {
//      return AlertDialog(
//
//        title: Text('Saved'),
//      );
//    },
//    );
//  }
}
