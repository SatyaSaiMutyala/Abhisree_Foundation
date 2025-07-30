import 'package:get/get.dart';
import '../api/apiProvider.dart';

class GalleryController extends GetxController {
  RxList<GalleryItem> galleryList = <GalleryItem>[].obs;
  RxBool isLoading = false.obs;
  final ApiProvider _apiProvider = ApiProvider();

  RxList<GalleryItem> imageList = <GalleryItem>[].obs;
  RxList<GalleryItem> videoList = <GalleryItem>[].obs;

  List<GalleryItem> get images => imageList;
  List<GalleryItem> get videos => videoList;

  Future<void> fetchGallery() async {
    isLoading.value = true;
    try {
      final response = await _apiProvider.getRequest('get-eventgallery');
      if (response['success']) {
        galleryList.value = (response['gallery'] as List)
            .map((e) => GalleryItem.fromJson(e))
            .toList();
        imageList.value =
            galleryList.where((e) => e.mediaType == 'image').toList();
        videoList.value =
            galleryList.where((e) => e.mediaType == 'video').toList();
      }
    } catch (e) {
      print("Error fetching gallery: $e");
    }
    isLoading.value = false;
  }
}

class GalleryItem {
  final int id;
  final String eventName;
  final String mediaType;
  final String? description;
  final String url;

  GalleryItem({
    required this.id,
    required this.eventName,
    required this.mediaType,
    this.description,
    required this.url,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['id'],
      eventName: json['event_name'],
      mediaType: json['media_type'],
      description: json['description'],
      url: json['url'],
    );
  }
}
