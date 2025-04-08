class UserDetailsModal {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
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

  UserDetailsModal({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
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
  });

  factory UserDetailsModal.fromJson(Map<String, dynamic> json) {
    return UserDetailsModal(
      id: json['user']['id'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
      gender: json['user']['gender'],
      userType: json['user']['user_type'],
      phoneNumber: json['user']['phone_number'],
      photoPath: json['user']['photo_path'],
      otp: json['user']['otp'],
      otpExpiry: json['user']['otp_expiry'],
      refId: json['user']['ref_id'],
      token: json['user']['token'],
      tokenExpiry: json['user']['token_expiry'],
      createdAt: json['user']['created_at'],
      updatedAt: json['user']['updated_at'],
      progress: json['user']['progress'],
    );
  }
}
