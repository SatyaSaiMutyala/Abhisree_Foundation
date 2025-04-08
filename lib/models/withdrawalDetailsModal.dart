class WithdrawaldetailsModal {
  final int bankId;
  final int userId;
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String userType;
  final String phoneNumber;
  final String? photoPath;
  final String? otp;
  final String? otpExpiry;
  final String refId;
  final String token;
  final String tokenExpiry;
  final String createdAt;
  final String updatedAt;
  final String progress;
  final String password;
  final String bankName;
  final String accountNumber;
  final String ifsc;
  final String holderName;
  final String? image;

  WithdrawaldetailsModal({
    required this.bankId,
    required this.userId,
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
    required this.tokenExpiry,
    required this.createdAt,
    required this.updatedAt,
    required this.progress,
    required this.password,
    required this.bankName,
    required this.accountNumber,
    required this.ifsc,
    required this.holderName,
    this.image,
  });

  factory WithdrawaldetailsModal.fromJson(Map<String, dynamic> json) {
    return WithdrawaldetailsModal(
      bankId: json['bank_id'],
      userId: json['user_id'],
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      userType: json['user_type'],
      phoneNumber: json['phone_number'],
      photoPath: json['photo_path'],
      otp: json['otp'],
      otpExpiry: json['otp_expiry'],
      refId: json['ref_id'],
      token: json['token'],
      tokenExpiry: json['token_expiry'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      progress: json['progress'],
      password: json['password'],
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      ifsc: json['ifsc'],
      holderName: json['holder_name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        "bank_id": bankId,
        "user_id": userId,
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "user_type": userType,
        "phone_number": phoneNumber,
        "photo_path": photoPath,
        "otp": otp,
        "otp_expiry": otpExpiry,
        "ref_id": refId,
        "token": token,
        "token_expiry": tokenExpiry,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "progress": progress,
        "password": password,
        "bank_name": bankName,
        "account_number": accountNumber,
        "ifsc": ifsc,
        "holder_name": holderName,
        "image": image,
      };
}
