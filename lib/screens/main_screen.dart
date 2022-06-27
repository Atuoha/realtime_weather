import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/city.dart';
import 'package:http/http.dart' as http;

import '../components/main_data_container.dart';
import '../components/weather_item.dart';
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
  var isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    var cityData = Provider.of<CityData>(context);
    if (isInit) {
      var urlString =
          'https://api.openweathermap.org/data/2.5/forecast?q=${cityData.weatherCity}&appid=${cityData.weatherAPI}';
      var searchedResult = await http.get(Uri.parse(urlString));
      var response = json.decode(searchedResult.body);

      if (searchedResult.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
      }

      // Updating new weather details through provider
      cityData.updateWeather(
          // You can assign them to a variable if you desire
          response['list'][0]['main']['humidity'],
          response['list'][0]['main']['pressure'],
          response['list'][0]['wind']['speed'],
          response['list'][0]['wind']['deg'],
          response['list'][0]['sys']['sunrise'],
          response['list'][0]['sys']['sunset'],
          response['list'][0]['timezone'],
          response['list'][0]['main']['temp'],
          response['list'][0]['main']['temp_max'],
          response['list'][0]['main']['temp_min'],
          response['list'][0]['weather'][0]['main'],
          response['list'][0]['main']['feels_like'],
          response['list'][0]['weather'][0]['icon'],
          response['list'][0]['weather'][0]['description'],
          response['list'][0]['weather'][0]['main'],
          response['list'][0]['sys']['country'],
          response['list']);
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
            DataContainer(
              imgUrl: isLoading
                  ? 'assets/images/selection.png'
                  : 'assets/images/${cityData.weatherImgUrl}.png',
              temp: cityData.weatherTemp.toStringAsFixed(0),
              weatherState: cityData.weatherWeatherStateName,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherItem(
                  title: 'Min Temp',
                  value: '${cityData.weatherMinTemp}',
                  unit: 'C',
                  imgAsset: 'assets/images/sleet.png',
                ),
                WeatherItem(
                  title: 'Humidity',
                  value: '${cityData.weatherHumidity}',
                  unit: '',
                  imgAsset: 'assets/images/humidity.png',
                ),
                WeatherItem(
                  title: 'Wind Speed',
                  value: '${cityData.weatherWindSpeed}',
                  unit: 'km\\h',
                  imgAsset: 'assets/images/windspeed.png',
                ),
                WeatherItem(
                  title: 'Max Temp',
                  value: '${cityData.weatherMaxTemp}',
                  unit: 'C',
                  imgAsset: 'assets/images/max-temp.png',
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    isLoading
                        ? CircularProgressIndicator(
                            color: Constants.primaryColor,
                          )
                        : Image.network(
                            'http://openweathermap.org/img/wn/${cityData.weatherImgUrl}.png'),
                    const SizedBox(width: 5),
                    Text(
                      cityData.weatherDescription.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Next 5 Days',
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              // color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cityData.weatherList.length,
                itemBuilder: (context, index) {
                  var data = cityData.weatherList[index];
                  return Container(
                    child: Text(
                      data['weather'][0]['main'],
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
