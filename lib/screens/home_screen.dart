import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// NIXX0012
class _HomeScreenState extends State<HomeScreen> {
  int humidity = 0;
  int temperature = 0;
  int pressure = 0;
  int windSpeed = 0;
  int maxTemp = 0;
  int minTemp = 0;
  String weatherStateName = 'Loading...';

  String imgUrl = '';
  String description = '';
  String currentState = '...Loading';
  double lon = 7.03041; // default location longitude
  double lat = 5.48333; // default location latitude
  String location = 'Owerri, Nigeria'; // default location name



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold();
  }
}
