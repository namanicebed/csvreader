import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import './StoreInfo.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List data;
  bool loading = true;
  Future<String> fetchStores() async {
    final response =
        await http.get('https://intense-wildwood-37342.herokuapp.com/stores');
    // print(response.body);
    if (response.statusCode == 200) {
      // print(json.decode(response.body)['stores']);
      setState(() {
        var resBody = json.decode(response.body);
        data = resBody['stores'];
        loading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    fetchStores();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
          backgroundColor: Color(0xff262626),
          appBar: AppBar(
            title: Text("Stores"),
            backgroundColor: Color(0xff5E72EE),
          ),
          body: loading == true
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xff5E72EE)),
                  ),
                )
              : ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                        margin: EdgeInsets.all(7),
                        elevation: 5,
                        color: Color(0xff444444),
                        child: GestureDetector(
                          child: ListTile(
                            title: Text(
                              data[index]['entityName'],
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(data[index]['city'],
                                style: TextStyle(
                                    color: Color(0xffe8e8e8), fontSize: 11)),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StoreInfo(
                                      data[index]["country"],
                                      data[index]["licenseNumber"],
                                      data[index]["operationType"],
                                      data[index]["establishmentType"],
                                      data[index]["entityName"],
                                      data[index]["dbaName"],
                                      data[index]["streetNumber"],
                                      data[index]["streetName"],
                                      data[index]["addressLine2"],
                                      data[index]["addressLine3"],
                                      data[index]["city"],
                                      data[index]["state"],
                                      data[index]["zipCode"],
                                      data[index]["squareFootage"])),
                            );
                          },
                        ));
                  },
                )),
    );
  }
}
