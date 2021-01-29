import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'getData.dart';

class Crud extends StatefulWidget {
  final List list;
  final int index;
  Crud({this.list, this.index});

  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool editMode = false;

  /* void SaveData(String name, String pass) async {
    //print("Name: " + _name.text + "  Password: " + _password.text);

    name = _name.text;
    pass = _password.text;

    var url = 'http://192.168.100.11:84/flutter_mysql/flutter_register.php';
    var data = {"name": name, "password": pass};
    var res = await http.post(url, body: data);
  }*/

  addUpdateData() {
    if (editMode) {
      var url = 'http://192.168.100.11:84/flutter_mysql/flutter_edit.php';
      http.post(url, body: {
        'id': widget.list[widget.index]['id'],
        'name': _name.text,
        'password': _password.text,
      });
    } else {
      var url = 'http://192.168.100.11:84/flutter_mysql/flutter_register.php';
      http.post(url, body: {
        'name': _name.text,
        'password': _password.text,
      });
    }
  }

  @override
  void initState() {
    _name = TextEditingController(text: '');
    _password = TextEditingController(text: '');
    if (widget.index != null) {
      editMode = true;
      _name.text = widget.list[widget.index]['name'];
      _password.text = widget.list[widget.index]['pass'];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(editMode ? 'Update' : 'AddData'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(150, 30, 150, 10),
                    child: Text(
                      "Register",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    width: 120,
                    child: TextField(
                      controller: _name,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 5, 5, 5),
                    child: Text("Password",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    width: 120,
                    child: TextField(
                      //obscureText: true,
                      controller: _password,
                      autofocus: true,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            addUpdateData();
                            //SaveData(_name.text, _password.text);
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => getData()));
                        },
                        child: Text(
                          editMode ? 'Update' : "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
