import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
//import 'package:intl/intl_browser.dart';

class WorldTime {
  String location; // Location name for UI
  String time; // Time in that location
  String flag; // url to an asset flag icon
  String url; // location url for API endpoint
  bool isDaytime; // To check if it is day or night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String offsetAddSub = data['utc_offset'];
      offset = offset.substring(1, 3);
      offsetAddSub = offsetAddSub.substring(0, 1);
      print(offsetAddSub);

      //print(datetime);
      print(offset);

      //Creating Datetime

      DateTime now = DateTime.parse(datetime);

      if (offsetAddSub.contains('+')) {
        now = now.add(Duration(hours: int.parse(offset)));
      } else {
        now = now.subtract(Duration(hours: int.parse(offset)));
      }
      //now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 19;

      time = DateFormat.jm().format(now);

      //time = now.toString();
    } catch (e) {
      time = 'Failed to get data: $e';
    }
  }
}
