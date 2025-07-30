
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/SocialMediaController.dart';

class SocialMediaScreen extends StatelessWidget {
  final SocialLinksController controller = Get.put(SocialLinksController());

  final Map<String, String> icons = {
    'Instagram': 'https://cdn-icons-png.flaticon.com/512/2111/2111463.png',
    'Facebook': 'https://cdn-icons-png.flaticon.com/512/733/733547.png',
    'YouTube': 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/2560px-YouTube_full-color_icon_%282017%29.svg.png',
    'Website': 'https://cdn-icons-png.flaticon.com/512/841/841364.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connect With Us')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final data = controller.socialLinks.value;
        if (data == null) {
          return Center(child: Text("No links available."));
        }

        final items = [
          {'name': 'Instagram', 'url': data.instagram},
          {'name': 'Facebook', 'url': data.facebook},
          {'name': 'YouTube', 'url': data.youtube},
          {'name': 'Website', 'url': data.website},
        ];

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: Image.network(
                icons[item['name']]!,
                width: 30,
                height: 30,
                errorBuilder: (_, __, ___) => Icon(Icons.broken_image),
              ),
              title: Text(
                item['name']!,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Discover who we are",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                final Uri url = Uri.parse(item['url']!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not open ${item['name']}')),
                  );
                }
              },
            );
          },
        );
      }),
    );
  }
}
