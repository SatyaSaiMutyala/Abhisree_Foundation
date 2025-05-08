class DonationCategoryModel {
  final int id;
  final String title;
  final String image;
  final int campaign_id;

  DonationCategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.campaign_id,
  });

  factory DonationCategoryModel.fromJson(Map<String, dynamic> json) {
    return DonationCategoryModel(
      id: json['id'],
      title: json['name'],
      image: json['image'],
      campaign_id: json['campaign_id'],
    );
  }
}
