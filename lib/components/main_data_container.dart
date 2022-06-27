import 'package:flutter/material.dart';
import '../constants/constants.dart';

class DataContainer extends StatelessWidget {
  final String imgUrl;
  final String weatherState;
  final String temp;
  const DataContainer({
    Key? key,
    required this.imgUrl,
    required this.weatherState,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Constants.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Constants.primaryColor.withOpacity(.5),
            offset: const Offset(0, 25),
            blurRadius: 10,
            spreadRadius: -12,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -40,
            right: 20,
            child: Image.asset(
              imgUrl,
              width: 150,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: Text(
              weatherState,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  temp,
                  style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white38,
                  ),
                ),
                const Text(
                  'o',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white38,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
