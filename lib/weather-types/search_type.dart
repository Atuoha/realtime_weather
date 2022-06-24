import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/city.dart';

class SearchType extends StatelessWidget {
  static const routeName = '/search-selection';
  const SearchType({Key? key}) : super(key: key);

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
              onPressed: null,
              child: const Icon(
                Icons.pin_drop,
                color: Colors.white,
              ),
            )
          : null,
      appBar: AppBar(
        
        backgroundColor: Constants.primaryColor,
        title: const Text('Search City'),
      ),
    );
  }
}
