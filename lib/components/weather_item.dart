import 'package:flutter/material.dart';
import '../constants/constants.dart';

class WeatherItem extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String imgAsset;
  const WeatherItem({
    Key? key,
    required this.imgAsset,
    required this.title,
    required this.value,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Constants.primaryColor.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(imgAsset),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$value $unit',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
