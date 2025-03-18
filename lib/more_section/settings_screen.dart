import 'package:adhisree_foundation/more_section/bank_details.dart';
import 'package:adhisree_foundation/more_section/profile_screen.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 20),

          // Image Section
          Container(
            width: 334,
            height: 144,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFFE9E6E6),
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage("assets/more_banner.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 30),

          // Profile Section
          ListTile(
            leading: Icon(Icons.person, color: Colors.teal),
            title: Text("Profile"),
            subtitle: Text("you can edit your profile first name, last name, phone number, email address"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
          Divider(),

          // Bank Details Section
          ListTile(
            leading: Icon(Icons.account_balance, color: Colors.teal),
            title: Text("Bank Details"),
            subtitle: Text("You can add accounts for withdrawals and set your primary account accordingly."),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BankAccountsScreen()));
            },
          ),
          Divider(),

          // Documents Section
          ListTile(
            leading: Icon(Icons.insert_drive_file, color: Colors.teal),
            title: Text("Documents"),
            subtitle: Text("you can download your documents like ID Card , visiting card"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              // Navigate to Documents Screen
            },
          ),
          Divider(),


          // Logout Button (Without Divider Below)
          ListTile(
            leading: Icon(Icons.logout, color: Colors.orange),
            title: Text(
              "Logout",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text("you can exist from this account"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              // Handle Logout Action
            },
          ),

          SizedBox(height: 20),

          // Delete Account (Centered)
          Center(
            child: TextButton(
              onPressed: () {
                // Handle Delete Account Action
              },
              child: Text(
                "Delete Account",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
