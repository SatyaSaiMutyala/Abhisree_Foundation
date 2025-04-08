class BannerModel {
  final int id;
  final String bannerPath;
  final String createdAt;
  final String updatedAt;

  BannerModel({
    required this.id,
    required this.bannerPath,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create an instance from JSON
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      bannerPath: json['banner_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
