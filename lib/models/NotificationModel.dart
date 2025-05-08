class NotificationModel {
  final int notificationId;
  final String title;
  final String description;
  final String createdAt;
  final int userSeen;
  final String imageUrl;

  NotificationModel({
    required this.notificationId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.userSeen,
    required this.imageUrl,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationId: json['notification_id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['created_at'],
      userSeen: json['user_seen'],
      imageUrl: json['image_url'],
    );
  }
}
