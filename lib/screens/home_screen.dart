import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/city.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// This screen handles both search type and selection type

class _HomeScreenState extends State<HomeScreen> {
  var isInit = true;
  var errorOccured = false;
  var errorMsg = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    var cityData = Provider.of<CityData>(context);
    if (isInit) {
      var urlString =
          'https://api.openweathermap.org/data/2.5/weather?q=${cityData.weatherCity}&appid=${cityData.weatherAPI}';
      var searchedResult = await http.get(Uri.parse(urlString));
      var response = json.decode(searchedResult.body);
      print(cityData.weatherCity);
      print(response);

      // if (jsonConvert.cod == '404') {
      //   errorMsg = jsonConvert.code.message;
      // }
      // try {
      //   print(jsonConvert.temp);
      // } catch (e) {
      //   setState(() {
      //     errorOccured = true;
      //   });
      // }
    }
    super.didChangeDependencies();
    setState(() {
      isInit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
