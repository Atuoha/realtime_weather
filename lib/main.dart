import 'package:flutter/material.dart';
import 'package:weatherapp/providers/city.dart';
import 'weather-types/types.dart';
import 'screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=> CityData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeatherApp',
        home: const GetStarted(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          WeatherType.routeName: (context) => const WeatherType(),
          CitySelectionType.routeName: (context) => const CitySelectionType(),
          SearchType.routeName: (context) => const SearchType(),
        },
      ),
    );
  }
}
