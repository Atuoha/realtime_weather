import 'package:flutter/foundation.dart';

class City with ChangeNotifier {
  int id;
  bool isSelected;
  final String city;
  final String country;
  final bool isDefault;
  

  City({
    required this.id,
    required this.isSelected,
    required this.city,
    required this.country,
    required this.isDefault,
  });

  void toggleSelected() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
