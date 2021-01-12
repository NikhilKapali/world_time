import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response =
        await get("http://worldtimeapi.org/api/timezone/america/new_york");
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    String datetime = data['datetime'];
    String utc_offset = data['utc_offset'].substring(1, 3);
    // print(datetime);
    // print(utc_offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(utc_offset)));
    print(now);
  }

  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
    print('initstate function ran');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading Screen')),
    );
  }
}
