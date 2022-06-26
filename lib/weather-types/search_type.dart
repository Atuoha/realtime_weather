import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../providers/city.dart';
import '../screens/screens.dart';

class SearchType extends StatefulWidget {
  static const routeName = '/search-selection';
  const SearchType({Key? key}) : super(key: key);

  @override
  State<SearchType> createState() => _SearchTypeState();
}

class _SearchTypeState extends State<SearchType> {
  var textController = TextEditingController();
  String searchedCity = '';
  var error = false;
  var responseImage = 'assets/images/location.png';
  var msg = 'Search by entering the name of the city';
  var isLoading = false;

  // submitting the search
  void searchCity() async {
    setState(() {
      isLoading = true;
    });
    var cityData = Provider.of<CityData>(context, listen: false);
    var urlString =
        'https://api.openweathermap.org/data/2.5/weather?q=$searchedCity&appid=${cityData.weatherAPI}';
    var searchedResult = await http.get(Uri.parse(urlString));
    var response = json.decode(searchedResult.body);

    // switching conditions based on statusCode
    switch (searchedResult.statusCode) {
      case 200:
        setState(() {
          isLoading = false;
          msg =
              'Weather details obtained. Click on the new appeared button to view';
          responseImage = 'assets/images/found.png';
        });
        // ignore: avoid_print
        print(response);
        cityData.updateWeatherCity(searchedCity);
        break;

      case 401:
      case 429:
      case 400:
        setState(() {
          isLoading = false;
          msg = 'Opps! Something is wrong somewhere';
          responseImage = 'assets/images/404.png';
        });
        cityData.clearSelectedData;
        break;

      case 404:
        setState(() {
          isLoading = false;
          msg = 'Opps! City not found. Check spellings';
          responseImage = 'assets/images/not_found.png';
        });
        cityData.clearSelectedData;
        break;

      default:
    }
  }

  // navigating to home screen
  void _navigateToMainScreen() {
    Navigator.of(context).pushNamed(MainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var cityProvider = Provider.of<CityData>(context);

    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      floatingActionButton: cityProvider.weatherCity.isNotEmpty
          ? FloatingActionButton(
              backgroundColor: Constants.primaryColor,
              onPressed: _navigateToMainScreen,
              child: const Icon(
                Icons.pin_drop,
                color: Colors.white,
              ),
            )
          : null,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
        title: const Text(
          'Search City',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          cityProvider.weatherCity.isNotEmpty
              ? IconButton(
                  onPressed: _navigateToMainScreen,
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                )
              : const Text(''),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: textController,
                    onSaved: (value) {
                      setState(() {
                        searchedCity = value!;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        searchedCity = value;
                      });
                    },
                    onFieldSubmitted: (value) {},
                    autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'City name is required ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter City Here',
                      hintStyle: const TextStyle(color: Colors.grey),
                      icon: Icon(Icons.pin_drop, color: Constants.primaryColor),
                      suffixIcon: IconButton(
                        onPressed: searchCity,
                        icon: Icon(
                          Icons.search,
                          color: Constants.primaryColor,
                        ),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: isLoading
                          ? Image.asset('assets/images/loading.png')
                          : Image.asset(responseImage),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isLoading ? 'Loading data...' : msg,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
