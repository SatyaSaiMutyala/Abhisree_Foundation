class VolunteerModal {
  final int id;
  final int userId;
  final String email;
  final String userType;
  final String pan;
  final String aadharNumber;
  final String address;
  final String firstName;
  final String lastName;
  final String? photoPath;
  final String? aadharPath;
  final String? idCardImage;
  final String? visitingCardImage;
  final String createdAt;
  final String updatedAt;

  VolunteerModal({
    required this.id,
    required this.userId,
    required this.email,
    required this.userType,
    required this.pan,
    required this.aadharNumber,
    required this.address,
    required this.firstName,
    required this.lastName,
    this.photoPath,
    this.aadharPath,
    this.idCardImage,
    this.visitingCardImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VolunteerModal.fromJson(Map<String, dynamic> json) {
    return VolunteerModal(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      email: json['email'] ?? '',
      userType: json['user_type'] ?? '',
      pan: json['pan'] ?? '',
      aadharNumber: json['aadhar_number'] ?? '',
      address: json['address'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      photoPath: json['photo_path'],
      aadharPath: json['aadhar_path'],
      idCardImage: json['id_card_image'] is String ? json['id_card_image'] : null,
      visitingCardImage: json['visiting_card_image'] is String ? json['visiting_card_image'] : null,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
