class ContactInfoModel {
  final ContactDetail phoneNumber;
  final ContactDetail whatsappNumber;

  ContactInfoModel({
    required this.phoneNumber,
    required this.whatsappNumber,
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      phoneNumber: ContactDetail.fromJson(json['phone_number']),
      whatsappNumber: ContactDetail.fromJson(json['whatsup_number']),
    );
  }
}

class ContactDetail {
  final int id;
  final String key;
  final String value;
  final String createdAt;
  final String updatedAt;

  ContactDetail({
    required this.id,
    required this.key,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ContactDetail.fromJson(Map<String, dynamic> json) {
    return ContactDetail(
      id: json['id'],
      key: json['key'],
      value: json['value'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
