class BankDetailModel {
  final int id;
  final String bankName;
  final String accountNumber;
  final String ifsc;
  final String createdAt;
  final String updatedAt;
  final int userId;
  final String holderName;
  final String? image;

  BankDetailModel({
    required this.id,
    required this.bankName,
    required this.accountNumber,
    required this.ifsc,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.holderName,
    this.image,
  });

  factory BankDetailModel.fromJson(Map<String, dynamic> json) {
    return BankDetailModel(
      id: json['id'],
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      ifsc: json['ifsc'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userId: json['user_id'],
      holderName: json['holder_name'],
      image: json['image'], // can be null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bank_name': bankName,
      'account_number': accountNumber,
      'ifsc': ifsc,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_id': userId,
      'holder_name': holderName,
      'image': image,
    };
  }
}
