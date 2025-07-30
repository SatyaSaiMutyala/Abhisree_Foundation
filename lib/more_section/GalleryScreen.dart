import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/GetGalleryController.dart';

class EventGalleryScreen extends StatefulWidget {
  @override
  _EventGalleryScreenState createState() => _EventGalleryScreenState();
}

class _EventGalleryScreenState extends State<EventGalleryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GalleryController controller = Get.put(GalleryController());

  @override
  void initState() {
    super.initState();
    controller.fetchGallery();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Gallery"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Images"),
            Tab(text: "Videos"),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return TabBarView(
          controller: _tabController,
          children: [
            ImageGalleryTab(images: controller.images),
            VideoGalleryTab(videos: controller.videos),
          ],
        );
      }),
    );
  }
}



class ImageGalleryTab extends StatelessWidget {
  final List<GalleryItem> images;

  const ImageGalleryTab({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Center(child: Text("No images available."));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final item = images[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  item.url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.eventName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (item.description != null && item.description!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          item.description!,
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class VideoGalleryTab extends StatelessWidget {
  final List<GalleryItem> videos;

  const VideoGalleryTab({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) {
      return Center(child: Text("No videos available."));
    }

    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return VideoPlayerItem(
          url: video.url,
          title: video.eventName,
          description: video.description,
        );
      },
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String url;
  final String title;
  final String? description;

  const VideoPlayerItem({
    super.key,
    required this.url,
    required this.title,
    this.description,
  });

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          isInitialized = true;
        });
      });

    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$minutes:$seconds";
  }

  void togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

 @override
Widget build(BuildContext context) {
  if (!isInitialized) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: CircularProgressIndicator(),
      ),
    );
  }

  final position = _controller.value.position;
  final duration = _controller.value.duration;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: togglePlayPause,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_controller),
                    if (!_controller.value.isPlaying)
                      const Icon(Icons.play_circle_fill,
                          size: 64, color: Colors.white70),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (duration.inMilliseconds > 0)
          Row(
            children: [
              Text(formatDuration(position),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500)),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Theme.of(context).primaryColor,
                    inactiveTrackColor: Colors.grey.shade300,
                    trackHeight: 4.0,
                    thumbColor: Theme.of(context).primaryColor,
                    overlayColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8),
                  ),
                  child: Slider(
                    value: position.inMilliseconds.toDouble(),
                    max: duration.inMilliseconds.toDouble(),
                    onChanged: (value) {
                      _controller.seekTo(Duration(milliseconds: value.toInt()));
                    },
                  ),
                ),
              ),
              Text(formatDuration(duration),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500)),
            ],
          ),
        const SizedBox(height: 8),
        Text(widget.title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
        if (widget.description != null && widget.description!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              widget.description!,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ),
        const SizedBox(height: 16),
        Divider(color: Colors.grey.shade300),
      ],
    ),
  );
}

}


