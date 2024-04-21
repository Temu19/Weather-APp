import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  late String time;
  String flag; //url to asset flag
  String url; //location url
  late bool isDaytime;


  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async{

    //Error Handling
    //try{} catch(e) {}
    try{
      //make request
      Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map  <String, dynamic> data =  jsonDecode(response.body);
      //print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));


      isDaytime = now.hour > 6 && now.hour < 20 ? true: false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
        print('caught error: $e');
        time = 'Could not get time data';
    }

  }
}
