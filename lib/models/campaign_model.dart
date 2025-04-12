class Campaign {
  final int id;
  final String image;
  final String name;
  final String goalPrice;
  final String donationCount;
  final int totalDonation;

  Campaign({
    required this.id,
    required this.image,
    required this.name,
    required this.goalPrice,
    required this.donationCount,
    required this.totalDonation,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      goalPrice: json['goal_price'].toString(),
      // goalPrice: double.tryParse(json['goal_price'].toString())?.toInt() ?? 0,
      donationCount: json['donation_count'].toString(),
      totalDonation: double.tryParse(json['total_donation'].toString())?.toInt() ?? 0,
    );
  }
}
