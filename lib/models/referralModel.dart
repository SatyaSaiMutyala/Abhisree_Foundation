class ReferralUser {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String gender;
  final String userType;
  final String phoneNumber;
  final String? photoPath;
  final String? refId;
  final String token;
  final String? progress;

  ReferralUser({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    required this.gender,
    required this.userType,
    required this.phoneNumber,
    this.photoPath,
    this.refId,
    required this.token,
    this.progress,
  });

  factory ReferralUser.fromJson(Map<String, dynamic> json) {
    return ReferralUser(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'] ?? '',
      userType: json['user_type'],
      phoneNumber: json['phone_number'],
      photoPath: json['photo_path'],
      refId: json['ref_id'],
      token: json['token'],
      progress: json['progress']?.toString(),
    );
  }
}

class ReferralResponse {
  final List<ReferralUser> primaryReferral;
  final List<ReferralUser> secondaryReferral;
  final ReferralUser user;

  ReferralResponse({
    required this.primaryReferral,
    required this.secondaryReferral,
    required this.user,
  });

  factory ReferralResponse.fromJson(Map<String, dynamic> json) {
    return ReferralResponse(
      primaryReferral: (json['primary_referral'] as List)
          .map((e) => ReferralUser.fromJson(e))
          .toList(),
      secondaryReferral: (json['secondaryReferred'] as List)
          .map((e) => ReferralUser.fromJson(e))
          .toList(),
      user: ReferralUser.fromJson(json['user']),
    );
  }
}
