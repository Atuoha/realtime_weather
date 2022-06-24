import 'package:flutter/cupertino.dart';
import '../models/city.dart';

class CityData extends ChangeNotifier {
  // https://home.openweathermap.org/api_keys
  var weatherAPI = '';

  // weather data
  String weatherCity = '';
  var selectedlatitude = 0.0;
  var selectedlongitudeg = 0.0;
  int selectedhumidity = 0;
  int selectedtemperature = 0;
  int selectedpressure = 0;
  int selectedWindSpeed = 0;
  int selectedMaxTemp = 0;
  int selectedMinTemp = 0;
  String selectedWeatherStateName = 'Loading...';

  String selectedImgUrl = '';
  String selectedDescription = '';
  String selectedDurrentState = '...Loading';

  // mode
  bool selectionMode = true;

  void toggleMode(bool selection) {
    selectionMode = selection;
    switch (selection) {
      case false:
        weatherCity = '';
        break;
      default:
    }
    notifyListeners();
  }

  // for selection type mode  - selecting the first city as default
  void swapSelectedData() {
    var city = _citiesList.firstWhere(
      (city) => city.isSelected == true,
    );
    weatherCity = city.city;
  }

// for search type -- assigning the approved city to weatherCity variable
  void updateWeatherCity(String city) {
    weatherCity = city;
    notifyListeners();
  }

  void clearSelectedData() {
    weatherCity = '';
  }

  void toggleIsSelected(int id) {
    var city = _citiesList.firstWhere(
      (city) => city.id == id,
    );
    city.toggleSelected();
    notifyListeners();
  }

  // void updateWeather() {
  //   currentWeather = data;
  //   notifyListeners();
  // }

  List cities() {
    return [..._citiesList];
  }

  //List of Cities data
  //-- if you need more cities to select from, you can use the city.list. follow the format and add more cities to the list
  final List _citiesList = [
    City(
      id: 1,
      isSelected: false,
      city: 'Lagos',
      country: 'Nigeria',
      isDefault: false,
      // longitude: 3.75,
      // latitude: 6.58333,
    ),
    City(
      id: 19,
      isSelected: true,
      city: 'Owerri',
      country: 'Nigeria',
      isDefault: true,
      // longitude: 7.03041,
      // latitude: 5.48333,
    ),
    City(
      id: 20,
      isSelected: false,
      city: 'Port Harcourt',
      country: 'Nigeria',
      isDefault: false,
      // longitude: 7.0134,
      // latitude: 4.77742,
    ),
    City(
      id: 21,
      isSelected: false,
      city: 'Abuja',
      country: 'Nigeria',
      isDefault: false,
      // longitude: 7.48976,
      // latitude: 9.05735,
    ),
    City(
      id: 16,
      isSelected: false,
      city: 'Regina',
      country: 'Canada',
      isDefault: false,
      // longitude: -104.617798,
      // latitude: 50.450081,
    ),
    City(
      id: 2,
      isSelected: false,
      city: 'London',
      country: 'United Kindgom',
      isDefault: false,
      // longitude: -0.09184,
      // latitude: 51.512791,
    ),
    City(
      id: 17,
      isSelected: false,
      city: 'Saskatchewan',
      country: 'Canada',
      isDefault: false,
      // longitude: -106.000992,
      // latitude: 54.000099,
    ),
    City(
      id: 18,
      isSelected: false,
      city: 'Edinburgh',
      country: 'United Kingdom',
      isDefault: false,
      // longitude: -3.19648,
      // latitude: 55.952061,
    ),
    City(
      id: 3,
      isSelected: false,
      city: 'Tokyo',
      country: 'Japan',
      isDefault: false,
      // longitude: 139.691711,
      // latitude: 35.689499,
    ),
    City(
      id: 4,
      isSelected: false,
      city: 'Delhi',
      country: 'India',
      isDefault: false,
      // longitude: 77.216667,
      // latitude: 28.666668,
    ),
    City(
      id: 5,
      isSelected: false,
      city: 'Beijing',
      country: 'China',
      isDefault: false,
      // longitude: 116.397232,
      // latitude: 39.907501,
    ),
    City(
      id: 6,
      isSelected: false,
      city: 'Paris',
      country: 'France',
      isDefault: false,
      // longitude: 2.3486,
      // latitude: 48.853401,
    ),
    City(
      id: 7,
      isSelected: false,
      city: 'Rome',
      country: 'Italy',
      isDefault: false,
      // longitude: 12.4839,
      // latitude: 41.894741,
    ),
    City(
      id: 8,
      isSelected: false,
      city: 'Amsterdam',
      country: 'Netherlatitudeds',
      isDefault: false,
      // longitude: 4.88969,
      // latitude: 52.374031,
    ),
    City(
      id: 9,
      isSelected: false,
      city: 'Barcelongitudea',
      country: 'Spain',
      isDefault: false,
      // longitude: 2.15899,
      // latitude: 41.38879,
    ),
    City(
      id: 10,
      isSelected: false,
      city: 'Miami',
      country: 'United States',
      isDefault: false,
      // longitude: -80.193657,
      // latitude: 25.774269,
    ),
    City(
      id: 11,
      isSelected: false,
      city: 'Vienna',
      country: 'Austria',
      isDefault: false,
      // longitude: 16.37208,
      // latitude: 48.208488,
    ),
    City(
      id: 12,
      isSelected: false,
      city: 'Berlin',
      country: 'United States',
      isDefault: false,
      // longitude: -88.943451,
      // latitude: 43.96804,
    ),
    City(
      id: 13,
      isSelected: false,
      city: 'Toronto',
      country: 'Canada',
      isDefault: false,
      // longitude: -79.416298,
      // latitude: 43.700111,
    ),
    City(
      id: 14,
      isSelected: false,
      city: 'Brussels',
      country: 'Belgium',
      isDefault: false,
      // longitude: 4.34878,
      // latitude: 50.850449,
    ),
    City(
      id: 15,
      isSelected: false,
      city: 'Nairobi',
      country: 'Kenya',
      isDefault: false,
      // longitude: 36.833328,
      // latitude: -1.28333,
    ),
    City(
      id: 22,
      isSelected: false,
      city: 'Accra',
      country: 'Ghana',
      isDefault: false,
      // longitude: -0.1969,
      // latitude: 5.55602,
    ),
    City(
      id: 23,
      isSelected: false,
      city: 'Johannesburg',
      country: 'South Africa',
      isDefault: false,
      // longitude: 28.043631,
      // latitude: -26.202271,
    ),
    City(
      id: 24,
      isSelected: false,
      city: 'California',
      country: 'United States',
      isDefault: false,
      // longitude: -76.507446,
      // latitude: 38.3004,
    ),
    City(
      id: 25,
      isSelected: false,
      city: 'Malyye Mosty',
      country: 'Russia',
      isDefault: false,
      // longitude: 37.700001,
      // latitude: 56.433334,
    ),
    City(
      id: 26,
      isSelected: false,
      city: 'New York',
      country: 'United States',
      isDefault: false,
      // longitude: -74.005966,
      // latitude: 40.714272,
    ),
    City(
      id: 27,
      isSelected: false,
      city: 'Chicago',
      country: 'United States',
      isDefault: false,
      // longitude: -87.650047,
      // latitude: 41.850029,
    ),
    City(
      id: 28,
      isSelected: false,
      city: 'Ibadan',
      country: 'Nigeria',
      isDefault: false,
      // longitude: 3.89639,
      // latitude: 7.38778,
    ),
    City(
      id: 29,
      isSelected: false,
      city: 'Montreal',
      country: 'Canada',
      isDefault: false,
      // longitude: -105.767662,
      // latitude: 54.050098,
    ),
    City(
      id: 30,
      isSelected: false,
      city: 'Edmonton',
      country: 'Canada',
      isDefault: false,
      // longitude: -113.468712,
      // latitude: 53.55014,
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
