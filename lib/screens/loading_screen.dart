import 'package:climaa/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  void initState(){
    super.initState();
    getLocation();
  }

  void getLocation () async {
    Location newlocation = Location() ;
    await newlocation.getCurrentLocation();
    print(newlocation.latitude);
    print(newlocation.longitude);
  }

  void getData () async {
   http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=e778054a624508542e3cdedfde545807'));
   if (response.statusCode == 200){
     String data = response.body;
     print(data);
   } else{
     print(response.statusCode);
   }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
