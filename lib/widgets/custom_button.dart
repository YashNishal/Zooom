import 'package:flutter/material.dart';
import 'package:zooom/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 16),
      child: ElevatedButton(onPressed: onPressed,
      child:Text(text,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: buttonColor)
          ),
          
        ),
      ),
    );
  }
}
