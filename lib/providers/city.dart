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
      isDefault: false,
      lon: 3.75,
      lat: 6.58333,
    ),
    City(
      id: 19,
      isSelected: true,
      city: 'Owerri',
      country: 'Nigeria',
      isDefault: true,
      lon: 7.03041,
      lat: 5.48333,
    ),
    City(
      id: 20,
      isSelected: true,
      city: 'Port Harcourt',
      country: 'Nigeria',
      isDefault: false,
      lon: 7.0134,
      lat: 4.77742,
    ),
    City(
      id: 21,
      isSelected: true,
      city: 'Abuja',
      country: 'Nigeria',
      isDefault: false,
      lon: 7.48976,
      lat: 9.05735,
    ),
    City(
      id: 16,
      isSelected: false,
      city: 'Regina',
      country: 'Canada',
      isDefault: false,
      lon: -104.617798,
      lat: 50.450081,
    ),
    City(
      id: 2,
      isSelected: false,
      city: 'London',
      country: 'United Kindgom',
      isDefault: false,
      lon: -0.09184,
      lat: 51.512791,
    ),
    City(
      id: 17,
      isSelected: false,
      city: 'Saskatchewan',
      country: 'Canada',
      isDefault: false,
      lon: -106.000992,
      lat: 54.000099,
    ),
    City(
      id: 18,
      isSelected: false,
      city: 'Edinburgh',
      country: 'United Kingdom',
      isDefault: false,
      lon: -3.19648,
      lat: 55.952061,
    ),
    City(
      id: 3,
      isSelected: false,
      city: 'Tokyo',
      country: 'Japan',
      isDefault: false,
      lon: 139.691711,
      lat: 35.689499,
    ),
    City(
      id: 4,
      isSelected: false,
      city: 'Delhi',
      country: 'India',
      isDefault: false,
      lon: 77.216667,
      lat: 28.666668,
    ),
    City(
      id: 5,
      isSelected: false,
      city: 'Beijing',
      country: 'China',
      isDefault: false,
      lon: 116.397232,
      lat: 39.907501,
    ),
    City(
      id: 6,
      isSelected: false,
      city: 'Paris',
      country: 'France',
      isDefault: false,
      lon: 2.3486,
      lat: 48.853401,
    ),
    City(
      id: 7,
      isSelected: false,
      city: 'Rome',
      country: 'Italy',
      isDefault: false,
      lon: 12.4839,
      lat: 41.894741,
    ),
    City(
      id: 8,
      isSelected: false,
      city: 'Amsterdam',
      country: 'Netherlands',
      isDefault: false,
      lon: 4.88969,
      lat: 52.374031,
    ),
    City(
      id: 9,
      isSelected: false,
      city: 'Barcelona',
      country: 'Spain',
      isDefault: false,
      lon: 2.15899,
      lat: 41.38879,
    ),
    City(
      id: 10,
      isSelected: false,
      city: 'Miami',
      country: 'United States',
      isDefault: false,
      lon: -80.193657,
      lat: 25.774269,
    ),
    City(
      id: 11,
      isSelected: false,
      city: 'Vienna',
      country: 'Austria',
      isDefault: false,
      lon: 16.37208,
      lat: 48.208488,
    ),
    City(
      id: 12,
      isSelected: false,
      city: 'Berlin',
      country: 'United States',
      isDefault: false,
      lon: -88.943451,
      lat: 43.96804,
    ),
    City(
      id: 13,
      isSelected: false,
      city: 'Toronto',
      country: 'Canada',
      isDefault: false,
      lon: -79.416298,
      lat: 43.700111,
    ),
    City(
      id: 14,
      isSelected: false,
      city: 'Brussels',
      country: 'Belgium',
      isDefault: false,
      lon: 4.34878,
      lat: 50.850449,
    ),
    City(
      id: 15,
      isSelected: false,
      city: 'Nairobi',
      country: 'Kenya',
      isDefault: false,
      lon: 36.833328,
      lat: -1.28333,
    ),
    City(
      id: 22,
      isSelected: false,
      city: 'Accra',
      country: 'Ghana',
      isDefault: false,
      lon: -0.1969,
      lat: 5.55602,
    ),
    City(
      id: 23,
      isSelected: false,
      city: 'Johannesburg',
      country: 'South Africa',
      isDefault: false,
      lon: 28.043631,
      lat: -26.202271,
    ),
    City(
      id: 24,
      isSelected: false,
      city: 'California',
      country: 'United States',
      isDefault: false,
      lon: -76.507446,
      lat: 38.3004,
    ),
    City(
      id: 25,
      isSelected: false,
      city: 'Malyye Mosty',
      country: 'Russia',
      isDefault: false,
      lon: 37.700001,
      lat: 56.433334,
    ),
    City(
      id: 26,
      isSelected: false,
      city: 'New York',
      country: 'United States',
      isDefault: false,
      lon: -74.005966,
      lat: 40.714272,
    ),
    City(
      id: 27,
      isSelected: false,
      city: 'Chicago',
      country: 'United States',
      isDefault: false,
      lon: -87.650047,
      lat: 41.850029,
    ),
    City(
      id: 28,
      isSelected: false,
      city: 'Ibadan',
      country: 'Nigeria',
      isDefault: false,
      lon: 3.89639,
      lat: 7.38778,
    ),
    City(
      id: 29,
      isSelected: false,
      city: 'Montreal',
      country: 'Canada',
      isDefault: false,
      lon: -105.767662,
      lat: 54.050098,
    ),
    City(
      id: 30,
      isSelected: false,
      city: 'Edmonton',
      country: 'Canada',
      isDefault: false,
      lon: -113.468712,
      lat: 53.55014,
    ),
  ];

  String defaultCity() {
    return _citiesList.firstWhere((city) => city.isDefault == true);
  }

  // Get the cities whose default is false
  List getDefaultCities() {
    return _citiesList.where((city) => city.isDefault == false).toList();
  }

  //Get the selected cities
  List getSelectedCities() {
    return _citiesList.where((city) => city.isSelected == true).toList();
  }
}
