import 'package:climaa/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climaa/services/networking.dart';

const kApiKey = 'e778054a624508542e3cdedfde545807';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void initState() {
    super.initState();
    getLocationdata();
  }

  void getLocationdata() async {
    Location newlocation = Location();
    await newlocation.getCurrentLocation();
    latitude = newlocation.latitude;
    longitude = newlocation.longitude;

    NetworkHelper networkHelper= NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey');

    var weather = networkHelper.getData();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
