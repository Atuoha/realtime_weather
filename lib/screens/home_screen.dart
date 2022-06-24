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
  int windSpeed = 0;
  int maxTemp = 0;
  String weatherStateName = 'Loading...';

  String imgUrl = '';
  String currentState = '...Loading';
  int woeid = 56057581; // Our WOEID for Lagos Nigeria which is the default
  String location = 'Lagos Nigeria'; // Default

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
