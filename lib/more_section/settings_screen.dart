import 'package:adhisree_foundation/more_section/bank_details.dart';
import 'package:adhisree_foundation/more_section/documents_screen.dart';
import 'package:adhisree_foundation/more_section/profile_screen.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/widgets/logout_form.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            children: [
              SizedBox(height: width * 0.35),

              // Image Section
              Container(
                width: width * 0.03,
                height: 144,
                margin: EdgeInsets.symmetric(horizontal: width * 0.025),
                decoration: BoxDecoration(
                  color: Color(0xFFE9E6E6),
                  borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                  image: DecorationImage(
                    image: AssetImage("assets/more_banner.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: width * 0.075),

              // Profile Section
              ListTile(
                leading: Image.asset("assets/icons/profile_icon.png"),
                title: Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "You can edit your profile first name, last name, phone number, email address",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    size: width * 0.04, color: Colors.black),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              Divider(),

              // Bank Details Section
              ListTile(
                leading: Image.asset("assets/icons/bank_icon.png"),
                title: Text(
                  "Bank Details",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "You can add accounts for withdrawals and set your primary account accordingly.",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    size: width * 0.04, color: Colors.black),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BankAccountsScreen()));
                },
              ),
              Divider(),

              // Documents Section
              ListTile(
                leading: Image.asset("assets/icons/document_icon.png"),
                title: Text(
                  "Documents",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "You can download your documents like ID Card, visiting card",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    size: width * 0.04, color: Colors.black),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DocumentsScreen()));
                },
              ),
              Divider(),

              // Logout Button (Without Divider Below)
              ListTile(
                leading: Image.asset("assets/icons/logout_icon.png"),
                title: Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "You can exit from this account",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    size: width * 0.04, color: Colors.black),
                onTap: () {
                  showCustomPopup(
                    context: context,
                    iconPath: "assets/icons/logout_icon.png",
                    message: "Are you sure you want to logout",
                    buttonText: "Logout",
                    onConfirm: () {
                      // Perform logout action
                    },
                  );
                },
              ),

              SizedBox(height: width * 0.02),

              // Delete Account (Centered)
              Center(
                child: TextButton(
                  onPressed: () {
                    showCustomPopup(
                      context: context,
                      iconPath: "assets/icons/logout_icon.png",
                      message: "Are you sure you want to Delete Account",
                      buttonText: "Delete",
                      onConfirm: () {
                        // Perform logout action
                      },
                    );
                  },
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // "More" Text Positioned on Image
          Positioned(
            top: width * 0.18,
            left: 30,
            child: Container(
              width: width * 0.2,
              height: 33,
              alignment: Alignment.center,
              child: Text(
                "More",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  // lineHeight: 33,
                  letterSpacing: 0,
                  textBaseline: TextBaseline.alphabetic,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
