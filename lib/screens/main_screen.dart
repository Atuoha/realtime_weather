import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/city.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/home';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// This screen handles both search type and selection type

class _MainScreenState extends State<MainScreen> {
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

      // RESPONSE SAMPLE
      // {"coord":{"lon":7.4943,"lat":6.4402},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"base":"stations","main":{"temp":297.79,"feels_like":298.63,"temp_min":297.79,"temp_max":297.79,"pressure":1011,"humidity":89,"sea_level":1011,"grnd_level":988},"visibility":10000,"wind":{"speed":2.46,"deg":221,"gust":6.35},"rain":{"1h":0.11},"clouds":{"all":100},"dt":1656094652,"sys":{"country":"NG","sunrise":1656047850,"sunset":1656092832},"timezone":3600,"id":2343279,"name":"Enugu","cod":200}

      // RESPONSE DISTRIBUTION
      // print(cityData.weatherCity);
      // print(response['weather'][0]['description']); //description
      // print(response['weather'][0]['main']); //weather
      // print(response['weather'][0]['icon']); //icon
      // print(response['main']['temp']); //temp
      // print(response['main']['feels_like']); //feels like
      // print(response['main']['temp_min']); //min_temp
      // print(response['main']['temp_max']); //max_temp
      // print(response['main']['pressure']); //pressure
      // print(response['main']['humidity']); //humidity
      // print(response['wind']['speed']); //windSpeed
      // print(response['wind']['deg']); //wind Degree
      // print(response['sys']['country']); //country
      // print(response['sys']['sunrise']); //sunrise
      // print(response['sys']['sunset']); //sunset
      // print(response['timezone']); //timezone

      // Updating new weather details through provider
      cityData.updateWeather(
          // You can assign them to a variable if you desire
          response['main']['humidity'],
          response['main']['pressure'],
          response['wind']['speed'],
          response['wind']['deg'],
          response['sys']['sunrise'],
          response['sys']['sunset'],
          response['timezone'],
          response['main']['temp'],
          response['main']['temp_max'],
          response['main']['temp_min'],
          response['weather'][0]['main'],
          response['main']['feels_like'],
          // 'http://openweathermap.org/img/wn/${response['weather'][0]['icon'] + '@3x.png'}',
          response['weather'][0]['icon'],
          response['weather'][0]['description'],
          response['weather'][0]['main'],
          response['sys']['country']);
    }
    super.didChangeDependencies();
    setState(() {
      isInit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cityData = Provider.of<CityData>(context, listen: false);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Constants.primaryColor,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // profile
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),

              cityData.selectionMode
                  ? Row(
                      children: [
                        Image.asset(
                          'assets/images/pin.png',
                          color: Constants.primaryColor,
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(8),
                            // dropdownColor: Constants.primaryColor,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                            value: cityData.weatherCity,
                            items: cityData
                                .getSelectedCities()
                                .map(
                                  (data) => DropdownMenuItem(
                                    value: data.city,
                                    child: Text(
                                      data.city,
                                      style: const TextStyle(
                                        // color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              cityData.updateWeatherCity(value.toString());
                              setState(() {
                                isInit = true;
                              });
                              print('City:$value');
                            },
                          ),
                        )
                      ],
                    )
                  : Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.pin_drop, color: Colors.white),
                        const SizedBox(width: 5),
                        Text(
                          cityData.weatherCity,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityData.weatherCity,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              DateFormat.yMMMMEEEEd().format(
                DateTime.now(),
              ),
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Constants.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Constants.primaryColor.withOpacity(.5),
                    offset: const Offset(0, 25),
                    blurRadius: 10,
                    spreadRadius: -12,
                  ),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -40,
                    right: 20,
                    child: Image.asset(
                      'assets/images/${cityData.weatherImgUrl}.png',
                      width: 150,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 20,
                    child: Text(
                      cityData.weatherWeatherStateName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cityData.weatherTemp.toStringAsFixed(0),
                          style: const TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white38,
                          ),
                        ),
                        const Text(
                          'o',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white38,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
