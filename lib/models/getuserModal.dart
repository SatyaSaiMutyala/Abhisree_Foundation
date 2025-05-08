// class UserDetailsModal {
//   final int id;
//   final String? firstName;
//   final String? lastName;
//   final String? email;
//   final String? gender;
//   final String userType;
//   final String phoneNumber;
//   final String? photoPath;
//   final String? otp;
//   final String? otpExpiry;
//   final String refId;
//   final String token;
//   final String tokenExpiry;
//   final String createdAt;
//   final String updatedAt;
//   final String progress;

//   UserDetailsModal({
//     required this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.gender,
//     required this.userType,
//     required this.phoneNumber,
//     this.photoPath,
//     this.otp,
//     this.otpExpiry,
//     required this.refId,
//     required this.token,
//     required this.tokenExpiry,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.progress,
//   });

//   factory UserDetailsModal.fromJson(Map<String, dynamic> json) {
//     return UserDetailsModal(
//       id: json['user']['id'] ?? '',
//       firstName: json['user']['first_name'] ?? '',
//       lastName: json['user']['last_name'] ?? '',
//       email: json['user']['email'] ?? '',
//       gender: json['user']['gender'] ?? '',
//       userType: json['user']['user_type'] ?? '',
//       phoneNumber: json['user']['phone_number'] ?? '',
//       photoPath: json['user']['photo_url'] ?? '',
//       otp: json['user']['otp'] ?? '',
//       otpExpiry: json['user']['otp_expiry'] ?? '',
//       refId: json['user']['ref_id'] ?? '',
//       token: json['user']['token'] ?? '',
//       tokenExpiry: json['user']['token_expiry'] ?? '',
//       createdAt: json['user']['created_at'] ?? '',
//       updatedAt: json['user']['updated_at'] ?? '',
//       progress: json['user']['progress'] ?? '',
//     );
//   }
// }

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
  final int status;

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
    required this.status,
  });

  factory UserDetailsModal.fromJson(Map<String, dynamic> json) {
    final user =
        json['user'] ?? json; // handle both direct or nested under "user"
    return UserDetailsModal(
      id: user['id'] ?? 0,
      firstName: user['first_name'] ?? '',
      lastName: user['last_name'] ?? '',
      email: user['email'] ?? '',
      gender: user['gender'] ?? '',
      userType: user['user_type'] ?? '',
      phoneNumber: user['phone_number'] ?? '',
      photoPath: user['photo_url'] ?? '',
      otp: user['otp'] ?? '',
      otpExpiry: user['otp_expiry'] ?? '',
      refId: user['ref_id'] ?? '',
      token: user['token'] ?? '',
      tokenExpiry: user['token_expiry'] ?? '',
      createdAt: user['created_at'] ?? '',
      updatedAt: user['updated_at'] ?? '',
      progress: user['progress'] ?? '',
      status: user['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'gender': gender,
      'user_type': userType,
      'phone_number': phoneNumber,
      'photo_url': photoPath,
      'otp': otp,
      'otp_expiry': otpExpiry,
      'ref_id': refId,
      'token': token,
      'token_expiry': tokenExpiry,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'progress': progress,
    };
  }
}
