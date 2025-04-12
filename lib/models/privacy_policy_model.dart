
class PrivacyPolicyModel {
  final String title;
  final String privacyPolicies;

  PrivacyPolicyModel({
    required this.title,
    required this.privacyPolicies,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      title: json['title'],
      privacyPolicies: json['privacy_policies'],
    );
  }
}
