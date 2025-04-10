
import 'package:flutter/material.dart';
class DonationPriceCard extends StatelessWidget {
  final int id;
  final String amount;
  final String name;
  final bool isSelected;
  final Function(int, String, String) onSelect; 

  const DonationPriceCard({
    Key? key,
    required this.id,
    required this.amount,
    required this.name,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return
     GestureDetector(
      onTap: () {
        onSelect(id,amount, name); 
      },
      child: Container(
        width: width * 0.3,
        height: height * 0.12,
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(width * 0.03),
          border: Border.all(
            color: isSelected ? Color(0xFF1A73E8) : Colors.grey,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              amount,
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
                fontFamily: 'Poppins',
                color: Color(0xFF1A73E8),
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              name,
              style: TextStyle(
                fontSize: width * 0.025,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
