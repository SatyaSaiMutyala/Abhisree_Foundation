class WalletModal {
  int id;
  String firstName;
  String lastName;
  String email;
  String gender;
  String userType;
  String phoneNumber;
  String? photoPath;
  String? otp;
  String? otpExpiry;
  String refId;
  String token;
  String? tokenExpiry;
  String createdAt;
  String updatedAt;
  String? progress;
  int refBy;
  int amount;
  int status;
  String transcationId;
  String transcationAmount;
  String transactionType;

  WalletModal({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.userType,
    required this.phoneNumber,
    this.photoPath,
    this.otp,
    this.otpExpiry,
    required this.refId,
    required this.token,
    this.tokenExpiry,
    required this.createdAt,
    required this.updatedAt,
    this.progress,
    required this.refBy,
    required this.amount,
    required this.status,
    required this.transcationId,
    required this.transcationAmount,
    required this.transactionType,
  });

  factory WalletModal.fromJson(Map<String, dynamic> json) {
    return WalletModal(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      userType: json['user_type'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      photoPath: json['photo_url'] ?? '',
      otp: json['otp'] ?? '',
      otpExpiry: json['otp_expiry'] ?? '',
      refId: json['ref_id'] ?? '',
      token: json['token'] ?? '',
      tokenExpiry: json['token_expiry'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      progress: json['progress'] ?? '',
      refBy: json['ref_by'] is int ? json['ref_by'] : 0,
      amount: json['ref_amount'] is int ? json['ref_amount'] : 0,
      status: json['status'] ?? 0,
      transcationId: json['transaction_id']?.toString() ?? '',
      transcationAmount: json['tran_amount']?.toString() ?? '',
      transactionType: json['tran_type']?.toString() ?? '',
    );
  }
}

class UserResponseModel {
  List<WalletModal> users; // You can name it 'users' here
  int walletAmount;

  UserResponseModel({
    required this.users,
    required this.walletAmount,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      users: (json['user'] != null)
          ? List<WalletModal>.from(
              json['user'].map((e) => WalletModal.fromJson(e)))
          : [],
      walletAmount: json['wallet_amount'] ?? 0,
    );
  }
}
