import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adhisree_foundation/teams/referral_amount.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';

class ReferralsScreen extends StatefulWidget {
  @override
  _ReferralsScreenState createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  final String referralCode = "A1234"; // Example referral code

  // Dummy list of referred users
  final List<Map<String, String>> referredUsers = [
    {
      "name": "John Doe",
      "date": "12 Mar 2025",
      "time": "10:45 AM",
      "amount": "+25",
      "image": "assets/teams1.png"
    },
    {
      "name": "Emma Watson",
      "date": "14 Mar 2025",
      "time": "12:30 PM",
      "amount": "+25",
      "image": "assets/teams1.png"
    },
    {
      "name": "Michael Smith",
      "date": "15 Mar 2025",
      "time": "03:15 PM",
      "amount": "+25",
      "image": "assets/teams1.png"
    },
  ];

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: referralCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Referral code copied!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: 16),

          // Referrals Title
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Referrals",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Theme.of(context).shadowColor.withOpacity(0.8),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Referral Amount Widget
          ReferralAmountWidget(),
          SizedBox(height: 20),

          // Copy Referral Code & Share Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enables horizontal scrolling
              child: Row(
                children: [
                  // Copy Referral Code Card
                  Container(
                    width: 162,
                    height: 66,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        right: 10), // Adds spacing between items
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F2F2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFE4DFDF)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Referral Code Box
                        Container(
                          width: 79,
                          height: 34,
                          alignment: Alignment.center,
                          child: Text(
                            referralCode.toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                              color: Color(0xFF78797E),
                            ),
                          ),
                        ),

                        // Copy Button with Text
                        GestureDetector(
                          onTap: copyToClipboard,
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                child: Icon(Icons.copy,
                                    color: Color(0xFF338D9B), size: 18),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Copy",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF338D9B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Share Referral Code Card
                  Container(
                    width: 172,
                    height: 66,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F2F2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFE4DFDF)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Code to share referral code
                          },
                          child: Icon(Icons.share,
                              color: Color(0xFF338D9B), size: 24),
                        ),
                        Container(
                          width: 79,
                          height: 34,
                          alignment: Alignment.center,
                          child: Text(
                            "Share",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF338D9B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Referrals list",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Theme.of(context).shadowColor.withOpacity(0.8),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Referral List
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: referredUsers.length,
              separatorBuilder: (context, index) => Column(
                children: [
                  SizedBox(height: 10), // 83px gap
                  Divider(color: Colors.grey, thickness: 1), // Horizontal line
                  SizedBox(height: 10), // 83px gap
                ],
              ),
              itemBuilder: (context, index) {
                final user = referredUsers[index];
                return Row(
                  children: [
                    // User Profile Image
                    CircleAvatar(
                      radius: 31,
                      backgroundImage: AssetImage(user["image"]!),
                    ),
                    SizedBox(width: 12),

                    // User Name & Date/Time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user["name"]!,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "${user["date"]} - ${user["time"]}",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    Spacer(),

                    // Amount
                    Text(
                      user["amount"]!,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
