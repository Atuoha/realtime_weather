import 'package:flutter/cupertino.dart';

import '../models/city.dart';

class CityData extends ChangeNotifier {
  void toggleIsSelected(int id) {
    var city = _citiesList.firstWhere((city) => city.id == id);
    city.toggleSelected();
    notifyListeners();
  }

  List cities() {
    return [..._citiesList];
  }

  //List of Cities data
  final List _citiesList = [
    City(
      id: 1,
      isSelected: true,
      city: 'Lagos',
      country: 'Nigeria',
      isDefault: true,
    ),
    City(
      id: 2,
      isSelected: false,
      city: 'London',
      country: 'United Kindgom',
      isDefault: false,
    ),
    City(
      id: 3,
      isSelected: false,
      city: 'Tokyo',
      country: 'Japan',
      isDefault: false,
    ),
    City(
      id: 4,
      isSelected: false,
      city: 'Delhi',
      country: 'India',
      isDefault: false,
    ),
    City(
      id: 5,
      isSelected: false,
      city: 'Beijing',
      country: 'China',
      isDefault: false,
    ),
    City(
      id: 6,
      isSelected: false,
      city: 'Paris',
      country: 'Paris',
      isDefault: false,
    ),
    City(
      id: 7,
      isSelected: false,
      city: 'Rome',
      country: 'Italy',
      isDefault: false,
    ),
    City(
        id: 8,
        isSelected: false,
        city: 'Amsterdam',
        country: 'Netherlands',
        isDefault: false),
    City(
        id: 9,
        isSelected: false,
        city: 'Barcelona',
        country: 'Spain',
        isDefault: false),
    City(
        id: 10,
        isSelected: false,
        city: 'Miami',
        country: 'United States',
        isDefault: false),
    City(
        id: 11,
        isSelected: false,
        city: 'Vienna',
        country: 'Austria',
        isDefault: false),
    City(
        id: 12,
        isSelected: false,
        city: 'Berlin',
        country: 'Germany',
        isDefault: false),
    City(
        id: 13,
        isSelected: false,
        city: 'Toronto',
        country: 'Canada',
        isDefault: false),
    City(
        id: 14,
        isSelected: false,
        city: 'Brussels',
        country: 'Belgium',
        isDefault: false),
    City(
      id: 15,
      isSelected: false,
      city: 'Nairobi',
      country: 'Kenya',
      isDefault: false,
    ),
  ];

  List getDefaultCities() {
    return _citiesList.where((city) => city.isDefault == false).toList();
  }

  //Get the selected cities
  List getSelectedCities() {
    return _citiesList.where((city) => city.isSelected == true).toList();
  }
}
