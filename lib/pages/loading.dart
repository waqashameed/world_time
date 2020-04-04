import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void callWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
    });
  }

  void initState() {
    super.initState();
    callWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('loading')),
    );
  }
}
