// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;

  const MyButton(
      {Key? key, required this.buttonText, required this.iconImagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // icon
        Container(
          height: 90,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400, blurRadius: 40, spreadRadius: 4),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Image.asset(iconImagePath),
          ),
        ),

        SizedBox(
          height: 10,
        ),
        //Text
        Text(
          buttonText,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
        ),
      ],
    );
  }
}
