import 'package:flutter/material.dart';
import 'package:world_time_app/services.dart/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Greece', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Addis Ababa', location: 'Addis Ababa', flag: 'eth.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germa.jpg'),
  ];

  void updateTime(index) async {
        WorldTime instance = locations[index];
        await instance.getTime();
        //to home screen
        Navigator.pop(context, {
          'location':instance.location,
          'flag':instance.flag,
          'time':instance.time,
          'isDaytime':instance.isDaytime,

        });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[900],
        title: Text('Choose A Location',
          style: TextStyle(
            color: Colors.white,
          )
          ,
        ),
        elevation: 0,
        centerTitle: true,
      ),

      body: ListView.builder(

          itemCount: locations.length,
          itemBuilder:(context, index){

            return Padding(

              padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 4.0),
              child: Card(
                child: ListTile(

                  onTap: () {
                    updateTime(index);
                  },

                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),

    );
  }
}
