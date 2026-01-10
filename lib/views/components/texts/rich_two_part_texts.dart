import 'package:flutter/material.dart';

class RichTwoPartTexts extends StatelessWidget {
  final String leftPart;
  final String rightPart;

  const RichTwoPartTexts(
      {super.key, required this.leftPart, required this.rightPart});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, height: 1.5),
        children: [
          TextSpan(
            text: leftPart,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' $rightPart',
          ),
        ],
      ),
    );
  }
}
