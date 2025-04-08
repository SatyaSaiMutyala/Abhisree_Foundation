class CampaignDetails {
  final int id;
  final String image;
  final String name;
  final String goalPrice;
  final String innerImage;
  final String titleOne;
  final String paraOne;
  final String titleTwo;
  final String paraTwo;
  final String status;
  final List<CampaignPrice> prices;

  CampaignDetails({
    required this.id,
    required this.image,
    required this.name,
    required this.goalPrice,
    required this.innerImage,
    required this.titleOne,
    required this.paraOne,
    required this.titleTwo,
    required this.paraTwo,
    required this.status,
    required this.prices,
  });

  factory CampaignDetails.fromJson(Map<String, dynamic> json) {
    return CampaignDetails(
      id: json['campaign']['id'],
      image: json['campaign']['image'],
      name: json['campaign']['name'],
      goalPrice: json['campaign']['goal_price'],
      innerImage: json['campaign']['inner_image'],
      titleOne: json['campaign']['titleone'],
      paraOne: json['campaign']['paraone'],
      titleTwo: json['campaign']['titletwo'],
      paraTwo: json['campaign']['paratwo'],
      status: json['campaign']['status'],
      prices: (json['prices'] as List)
          .map((price) => CampaignPrice.fromJson(price))
          .toList(),
    );
  }
}

class CampaignPrice {
  final int id;
  final String price;
  final String priceName;
  final int campaignId;

  CampaignPrice({
    required this.id,
    required this.price,
    required this.priceName,
    required this.campaignId,
  });

  factory CampaignPrice.fromJson(Map<String, dynamic> json) {
    return CampaignPrice(
      id: json['id'],
      price: json['price'],
      priceName: json['price_name'],
      campaignId: json['campaign_id'],
    );
  }
}
