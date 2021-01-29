import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'crud.dart';

class getData extends StatefulWidget {
  @override
  _getDataState createState() => _getDataState();
}

class _getDataState extends State<getData> {
  Future getData() async {
    var url = "http://192.168.100.11:84/flutter_mysql/flutter_getData.php";
    var response = await http.get(url);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "GetData",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return ListTile(
                      leading: GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: () {
                          debugPrint("Edit clicked");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Crud(list: list, index: index)));
                        },
                      ),
                      title: Text(list[index]['name']),
                      subtitle: Text(list[index]['pass']),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            var url =
                                'http://192.168.100.11:84/flutter_mysql/flutter_delete.php';
                            http.post(url, body: {
                              'id': list[index]['id'],
                            });
                          });
                          debugPrint("Delete clicked");
                        },
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Crud()));
        },
        child: Icon(Icons.add),
        //
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
}
