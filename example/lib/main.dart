import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http_pro/http.dart' as http;
import 'package:http_pro/response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String status = "pending";

  @override
  void initState() {
    super.initState();
    _apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('http_request'),
        ),
        body: Center(
          child: Text('Status: $status'),
        ),
      ),
    );
  }

  _apiCall() async {
    Response res = await http.get("https://www.google.com");
    if (res.statusCode == 200) {
      log("success");
      setState(() {
        status = "success";
      });
    } else {
      log("fail");
      setState(() {
        status = "fail";
      });
    }
  }
}
