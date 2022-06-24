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
     
    ),
    City(
      id: 19,
      isSelected: false,
      city: 'Owerri',
      country: 'Nigeria',
   
    ),
    City(
      id: 20,
      isSelected: false,
      city: 'Port Harcourt',
      country: 'Nigeria',
     
    ),
    City(
      id: 21,
      isSelected: false,
      city: 'Abuja',
      country: 'Nigeria',
     
    ),
    City(
      id: 16,
      isSelected: false,
      city: 'Regina',
      country: 'Canada',
     
    ),
    City(
      id: 2,
      isSelected: false,
      city: 'London',
      country: 'United Kindgom',
    
    ),
    City(
      id: 17,
      isSelected: false,
      city: 'Saskatchewan',
      country: 'Canada',
     
    ),
    City(
      id: 18,
      isSelected: false,
      city: 'Edinburgh',
      country: 'United Kingdom',
   
    ),
    City(
      id: 3,
      isSelected: false,
      city: 'Tokyo',
      country: 'Japan',
    
    ),
    City(
      id: 4,
      isSelected: false,
      city: 'Delhi',
      country: 'India',
     
    ),
    City(
      id: 5,
      isSelected: false,
      city: 'Beijing',
      country: 'China',
    
    ),
    City(
      id: 6,
      isSelected: false,
      city: 'Paris',
      country: 'France',
  
    ),
    City(
      id: 7,
      isSelected: false,
      city: 'Rome',
      country: 'Italy',
    
    ),
    City(
      id: 8,
      isSelected: false,
      city: 'Amsterdam',
      country: 'Netherlatitudeds',
  
    ),
    City(
      id: 9,
      isSelected: false,
      city: 'Barcelongitudea',
      country: 'Spain',
  
    ),
    City(
      id: 10,
      isSelected: false,
      city: 'Miami',
      country: 'United States',
   
    ),
    City(
      id: 11,
      isSelected: false,
      city: 'Vienna',
      country: 'Austria',

    ),
    City(
      id: 12,
      isSelected: false,
      city: 'Berlin',
      country: 'United States',
     
    ),
    City(
      id: 13,
      isSelected: false,
      city: 'Toronto',
      country: 'Canada',
  
    ),
    City(
      id: 14,
      isSelected: false,
      city: 'Brussels',
      country: 'Belgium',
  
    ),
    City(
      id: 15,
      isSelected: false,
      city: 'Nairobi',
      country: 'Kenya',
   
    ),
    City(
      id: 22,
      isSelected: false,
      city: 'Accra',
      country: 'Ghana',
     
    ),
    City(
      id: 23,
      isSelected: false,
      city: 'Johannesburg',
      country: 'South Africa',
  
    ),
    City(
      id: 24,
      isSelected: false,
      city: 'California',
      country: 'United States',
   
    ),
    City(
      id: 25,
      isSelected: false,
      city: 'Malyye Mosty',
      country: 'Russia',
  
    ),
    City(
      id: 26,
      isSelected: false,
      city: 'New York',
      country: 'United States',
 
    ),
    City(
      id: 27,
      isSelected: false,
      city: 'Chicago',
      country: 'United States',

    ),
    City(
      id: 28,
      isSelected: false,
      city: 'Ibadan',
      country: 'Nigeria',

    ),
    City(
      id: 29,
      isSelected: false,
      city: 'Montreal',
      country: 'Canada',
   
    ),
    City(
      id: 30,
      isSelected: false,
      city: 'Edmonton',
      country: 'Canada',
   
    ),
  ];


  //Get the selected cities
  List getSelectedCities() {
    return _citiesList.where((city) => city.isSelected == true).toList();
  }

}
