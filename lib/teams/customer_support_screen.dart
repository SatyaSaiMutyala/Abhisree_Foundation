import 'package:adhisree_foundation/controllers/SettingsController.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupportScreen extends StatefulWidget {
  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  void initState() {
    super.initState();
    settingsController.fetchContactInfo('getSettings');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        if (settingsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final data = settingsController.contactInfo.value;

        if (data == null) {
          return Center(child: Text("No Contact Info Available"));
        }

        return Stack(
          children: [
            Positioned(
              top: height * 0.07,
              left: width * 0.35,
              child: Container(
                width: width * 0.41,
                height: height * 0.04,
                alignment: Alignment.center,
                child: Text(
                  "Customer Support",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.fontSizeExtraLarge,
                    height: 33 / 16,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Back button
            Positioned(
              top: height * 0.065,
              left: width * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: width * 0.1,
                  height: height * 0.05,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0XFFEFEEEE),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: width * 0.05,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Support options
            Positioned(
              top: height * 0.32,
              left: width * 0.28,
              child: Column(
                children: [
                  _buildSupportCard(
                    width,
                    "assets/icons/call_icon.png",
                    "Contact Us",
                    data.phoneNumber.value,
                    () => _makePhoneCall(data.phoneNumber.value),
                  ),
                  SizedBox(height: height * 0.046),
                  _buildSupportCard(
                    width,
                    "assets/icons/whatsapp_icon.png",
                    "WhatsApp",
                    data.whatsappNumber.value,
                    () => _openWhatsApp(data.whatsappNumber.value),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  // Reusable card widget with onTap
  Widget _buildSupportCard(double width, String iconPath, String text, String number, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.4,
        height: width * 0.3,
        padding: EdgeInsets.fromLTRB(width * 0.076, width * 0.049, width * 0.076, width * 0.049),
        decoration: BoxDecoration(
          color: Color(0xFFDAF6FA),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefaultExpand),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: width * 0.12,
              height: width * 0.12,
              fit: BoxFit.contain,
            ),
            SizedBox(height: width * 0.024),
            Text(
              text,
              style: TextStyle(fontSize: width * 0.038, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Phone dialer
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar("Error", "Could not open dialer");
    }
  }

  // WhatsApp launcher
  Future<void> _openWhatsApp(String phoneNumber) async {
    final Uri uri = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open WhatsApp");
    }
  }
}
