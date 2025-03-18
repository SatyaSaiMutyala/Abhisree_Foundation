import 'package:flutter/material.dart';

class WalletAmountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // Ensure Stack has a finite height
      child: Stack(
        children: [
          Positioned(
            left: 24,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21.18),
              ),
              elevation: 2,
              shadowColor: Color(0x171A1F1F),
              color: Color(0xFFDAF6FA),
              child: Container(
                width: MediaQuery.of(context).size.width -
                  50,
                height: 144,
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  "\$500.00",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
