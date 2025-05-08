import 'dart:io';
import 'package:adhisree_foundation/controllers/GetBrochureController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';


class Brochurescreen extends StatefulWidget {
  @override
  _BrochureScreenState createState() => _BrochureScreenState();
}

class _BrochureScreenState extends State<Brochurescreen> {
  final GetBrochureController getBrochureController = Get.put(GetBrochureController());

  @override
  void initState() {
    super.initState();
    getBrochureController.fetchBrochure('get-brochure');
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
        title: Text('Brochures'),
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (getBrochureController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final brochures = getBrochureController.brochureModel.value.brochures ?? [];

        if (brochures.isEmpty) {
          return Center(child: Text('No brochures available'));
        }

        return ListView.builder(
          itemCount: brochures.length,
          itemBuilder: (context, index) {
            final brochure = brochures[index];

            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(brochure.title ?? 'Untitled'),
                trailing: IconButton(
                  icon: Icon(Icons.download, color: Colors.green),
                  onPressed: brochure.url != null
                      ? () => downloadPDF(brochure.url!)
                      : null,
                ),
                onTap: () {
                  if (brochure.url != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Scaffold(
                          appBar: AppBar(title: Text(brochure.title ?? 'Brochure')),
                          body: PDF().cachedFromUrl(
                            brochure.url!,
                            placeholder: (progress) => Center(child: Text('$progress %')),
                            errorWidget: (error) => Center(child: Text('Error loading PDF')),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      }),
    );
  }
}
