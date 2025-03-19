import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final String iconPath;
  final String message;
  final String buttonText;
  final VoidCallback onConfirm;

  const CustomPopup({
    required this.iconPath,
    required this.message,
    required this.buttonText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.06),
      ),
      child: SizedBox(
        width: width * 0.9,
        height: height * 0.39,
        child: Padding(
          padding: EdgeInsets.all(width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: width * 0.12, // Adjust size as needed
                height: height * 0.08,
                color: Color(0XFF338D9B),
                fit: BoxFit.contain,
              ),
              SizedBox(height: height * 0.025),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: height * 0.036),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onConfirm();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF338D9B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to show the popup
void showCustomPopup({
  required BuildContext context,
  required String iconPath,
  required String message,
  required String buttonText,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) => CustomPopup(
      iconPath: iconPath,
      message: message,
      buttonText: buttonText,
      onConfirm: onConfirm,
    ),
  );
}
