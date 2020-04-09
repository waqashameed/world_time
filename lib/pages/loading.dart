import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:world_time/pages/choose_location.dart';

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
      'isDaytime': worldTime.isDaytime,
    });
  }

  void initState() {
    super.initState();
    callWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SpinKitWave(
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
