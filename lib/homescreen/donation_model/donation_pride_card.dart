import 'package:flutter/material.dart';

class DonationPriceCard extends StatelessWidget {
  final String amount;
  final String name;

  const DonationPriceCard({
    Key? key,
    required this.amount,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.3,
      height: height * 0.12,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(width * 0.03),
        border: Border.all(color: Color(0xFF338D9B), width: 1),
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
            maxLines: 2, // Ensures only one line is displayed
            overflow:
                TextOverflow.ellipsis, // Adds "..." when the text overflows
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class DonationSelectionScreen extends StatefulWidget {
//   @override
//   _DonationSelectionScreenState createState() =>
//       _DonationSelectionScreenState();
// }

// class _DonationSelectionScreenState extends State<DonationSelectionScreen> {
//   String? selectedAmount; // Store the selected amount

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Select Donation Amount")),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DonationPriceCard(
//               amount: "\$10",
//               name: "Basic",
//               isSelected: selectedAmount == "\$10",
//               onTap: () {
//                 setState(() {
//                   selectedAmount = "\$10";
//                 });
//               },
//             ),
//             SizedBox(width: 16),
//             DonationPriceCard(
//               amount: "\$20",
//               name: "Standard",
//               isSelected: selectedAmount == "\$20",
//               onTap: () {
//                 setState(() {
//                   selectedAmount = "\$20";
//                 });
//               },
//             ),
//             SizedBox(width: 16),
//             DonationPriceCard(
//               amount: "\$50",
//               name: "Premium",
//               isSelected: selectedAmount == "\$50",
//               onTap: () {
//                 setState(() {
//                   selectedAmount = "\$50";
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DonationPriceCard extends StatelessWidget {
//   final String amount;
//   final String name;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const DonationPriceCard({
//     Key? key,
//     required this.amount,
//     required this.name,
//     required this.isSelected,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: width * 0.3,
//         height: height * 0.12,
//         padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
//         decoration: BoxDecoration(
//           color: Color(0xFFF4F4F4),
//           borderRadius: BorderRadius.circular(width * 0.03),
//           border: Border.all(
//             color: isSelected ? Colors.green : Color(0xFF338D9B), // Change border color if selected
//             width: isSelected ? 3 : 1, // Make the border thicker if selected
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               amount,
//               style: TextStyle(
//                 fontSize: width * 0.04,
//                 fontWeight: FontWeight.w700,
//                 decoration: TextDecoration.none,
//                 fontFamily: 'Poppins',
//                 color: Color(0xFF1A73E8),
//               ),
//             ),
//             SizedBox(height: height * 0.01),
//             Text(
//               name,
//               style: TextStyle(
//                 fontSize: width * 0.025,
//                 fontWeight: FontWeight.w600,
//                 decoration: TextDecoration.none,
//                 fontFamily: 'Poppins',
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
