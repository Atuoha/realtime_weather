import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/city.dart';

class SearchType extends StatefulWidget {
  static const routeName = '/search-selection';
  const SearchType({Key? key}) : super(key: key);

  @override
  State<SearchType> createState() => _SearchTypeState();
}

class _SearchTypeState extends State<SearchType> {
  var textController = TextEditingController();
  String searchedCity = '';


  void searchCity(){

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
      floatingActionButton: cityProvider.searchedCity.isNotEmpty
          ? FloatingActionButton(
              backgroundColor: Constants.primaryColor,
              onPressed: searchCity,
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
          cityProvider.searchedCity.isNotEmpty
              ? IconButton(
                  onPressed: searchCity,
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                )
              : const Text(''),
        ],
      ),
      body: Padding(
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
                      onPressed: null,
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
            )
          ],
        ),
      ),
    );
  }
}
