class User {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? userType;
  final String? phoneNumber;
  final String? photoPath;
  final String? refId;
  final String? token;
  final String? tokenExpiry;
  final String? createdAt;
  final String? updatedAt;
  final String? progress;

  User({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.userType,
    this.phoneNumber,
    this.photoPath,
    this.refId,
    this.token,
    this.tokenExpiry,
    this.createdAt,
    this.updatedAt,
    this.progress,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      userType: json['user_type'],
      phoneNumber: json['phone_number'],
      photoPath: json['photo_path'],
      refId: json['ref_id'],
      token: json['token'],
      tokenExpiry: json['token_expiry'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      progress: json['progress']?.toString(), 
    );
  }
}
