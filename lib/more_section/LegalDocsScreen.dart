import 'dart:io';
import 'package:adhisree_foundation/controllers/LegalDocumentController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class LegalDocumentsScreen extends StatefulWidget {
  @override
  _LegalDocumentsScreenState createState() => _LegalDocumentsScreenState();
}

class _LegalDocumentsScreenState extends State<LegalDocumentsScreen> {
  final LegalDocumentController legalDocController = Get.put(LegalDocumentController());

  @override
  void initState() {
    super.initState();
    legalDocController.fetchLegalDocuments('get-legaldocument');
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
        title: Text('Legal Documents'),
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (legalDocController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final documents = legalDocController.legalDocModel.value.documents ?? [];

        if (documents.isEmpty) {
          return Center(child: Text('No legal documents available'));
        }

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final document = documents[index];

            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text('${document.name ?? ''}'),
                trailing: IconButton(
                  icon: Icon(Icons.download, color: Colors.green),
                  onPressed: document.url != null
                      ? () => downloadPDF(document.url!)
                      : null,
                ),
                onTap: () {
                  if (document.url != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Scaffold(
                          appBar: AppBar(title: Text('Document ${document.id ?? ''}')),
                          body: PDF().cachedFromUrl(
                            document.url!,
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
