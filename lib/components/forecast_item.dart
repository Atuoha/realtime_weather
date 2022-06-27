import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';

class ForecastItem extends StatelessWidget {
  final String image;
  final String status;
  final String time;
  final int selectedIndex;
  final int index;

  const ForecastItem({
    Key? key,
    required this.image,
    required this.status,
    required this.time,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateFormat.MEd().format(
      DateTime.parse(time),
    );
    var formattedTime = DateFormat('h:mma').format(
      DateTime.parse(time),
    );

    return Container(
      height: 80,
      width: 90,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: index == selectedIndex ? Constants.primaryColor : Colors.white,
        boxShadow: index == selectedIndex
            ? null
            : [
                BoxShadow(
                  color: Constants.primaryColor,
                  spreadRadius: 2,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 5,
                ),
              ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              status,
              style: TextStyle(
                color: selectedIndex == index
                    ? Colors.white
                    : Constants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Image.asset(
              image,
              width: 50,
            ),
            const SizedBox(height: 10),
            Text(
              '$formattedDate \n $formattedTime',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
