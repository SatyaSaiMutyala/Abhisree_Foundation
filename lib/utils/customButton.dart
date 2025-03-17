
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final bool outlined;

  const CustomButton({super.key, required this.text, required this.onPressed, this.outlined = false});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;

    Color primaryColor = Color(0XFF338D9B);
    
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: outlined ? Colors.white : primaryColor,
        padding: EdgeInsets.symmetric(vertical: width * 0.04),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: primaryColor,
            width: outlined ? 1 : 0,
          )
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: outlined ? primaryColor : Colors.white, fontSize: width * 0.05),
      ),
      ),

    );
    
  }
}
