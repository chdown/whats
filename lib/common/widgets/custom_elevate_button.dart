import 'package:flutter/material.dart';
import 'package:whats/common/utils/coloors.dart';

class CustomElevateButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;

  const CustomElevateButton({Key? key, this.buttonWidth, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
