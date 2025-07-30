import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/GetYourDonationController.dart';
import 'package:intl/intl.dart';

class DonationScreen extends StatefulWidget {
  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final controller = Get.put(DonationController());
  int? userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null) {
      Map<String, dynamic> decodedUserData = jsonDecode(userJson);
      setState(() {
        userId = decodedUserData['id'];
      });
      if (userId != null) {
        controller.fetchDonations('get-donation', userId.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donation History')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final donationData = controller.donationResponse.value;

        if (donationData == null || donationData.data.isEmpty) {
          return Center(child: Text('No donation records found.'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Donation Box
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.green.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Donation', style: TextStyle(fontSize: 18)),
                    Text(
                      "₹ ${NumberFormat("#,##0").format(double.tryParse(donationData.totalDonation ?? '0'))}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ],
                ),
              ),

              // Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Below is your donation activity history. You can keep track of all contributions you’ve made.",
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              const SizedBox(height: 10),

              // Donation List
              ListView.separated(
                itemCount: donationData.data.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => Divider(height: 0),
                itemBuilder: (context, index) {
                  final item = donationData.data[index];
                  final date = DateFormat('dd MMM yyyy – hh:mm a')
                      .format(DateTime.parse(item.createdAt));
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade50,
                      child: Icon(Icons.currency_rupee, color: Colors.green),
                    ),
                    title: Text(
                      "₹${NumberFormat('#,##0').format(double.tryParse(item.price))}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(date),
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
