import 'dart:io';
import 'package:adhisree_foundation/controllers/GetEarningController.dart';
import 'package:adhisree_foundation/controllers/LegalDocumentController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class EarningsScreen extends StatefulWidget {
  @override
  _EarningScreenState createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningsScreen> {
  // final LegalDocumentController legalDocumentController = Get.put(LegalDocumentController());
  final GetPlansController getPlansController = Get.put(GetPlansController());

  @override
  void initState() {
    super.initState();
    getPlansController.fetchPlans('get-earningplan');
  }

  Future<void> downloadPDF(String url) async {
    try {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        Directory? directory;

        if (Platform.isAndroid) {
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            directory = await getExternalStorageDirectory();
          }
        } else {
          directory = await getApplicationDocumentsDirectory();
        }

        final fileName = url.split('/').last;
        final filePath = '${directory!.path}/$fileName';

        await Dio().download(url, filePath);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Downloaded to ${directory.path}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Storage permission denied')),
        );
      }
    } catch (e) {
      print("Download error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earnings'),
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (getPlansController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final plans = getPlansController.plansModel.value.plans;

        if (plans == null || plans.isEmpty) {
          return Center(child: Text('No Earnings available'));
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final doc = plans[index];
            return Card(
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text('${doc.title}'),
                trailing: IconButton(
                  icon: Icon(Icons.download, color: Colors.green),
                  onPressed: () => downloadPDF(doc.url!),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: Text(doc.title ?? 'Earnings')),
                        body: PDF().cachedFromUrl(
                          doc.url!,
                          placeholder: (progress) =>
                              Center(child: Text('$progress %')),
                          errorWidget: (error) =>
                              Center(child: Text('Error loading PDF')),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
