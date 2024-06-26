import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    //print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'SKY.jpg' : 'lastnight.png';
    Color? bgColor =  data['isDaytime'] ? Colors.lightBlue[300] : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  TextButton.icon(onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState((){
                      data = {
                        'time':result['time'],
                        'location':result['location'],
                        'isDaytime':result['isDaytime'],
                        'flag':result['flag'],

                      };
                    });
                    },
                      icon:Icon(Icons.edit_location,
                      color: Colors.amberAccent,),
                      label: Text('Edit Location',
                      style: TextStyle(
                        color: Colors.grey[100],
                      ),),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
