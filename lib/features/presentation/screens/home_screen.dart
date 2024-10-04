import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _token;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        _token = token;
      });
      print("Device Token: $_token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications'),
      ),
      body: Center(
        child: _token == null
            ? CircularProgressIndicator()
            : Text('Device Token: $_token'),
      ),
    );
  }
}
