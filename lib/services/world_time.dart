import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // Location name for UI
  String time; // Time in that location
  String flag; // url to an asset flag icon
  String url; // location url for API endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezones/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      offset = offset.substring(1, 3);

      //print(datetime);
      //print(offset);

      //Creating Datetime

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = now.toString();
    } catch (e) {
      time = 'Failed to get data: $e';
    }
  }
}
