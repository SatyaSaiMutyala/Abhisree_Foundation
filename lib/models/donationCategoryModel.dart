class DonationCategoryModel {
  final int id;
  final String title;
  final String image;

  DonationCategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory DonationCategoryModel.fromJson(Map<String, dynamic> json) {
    return DonationCategoryModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
