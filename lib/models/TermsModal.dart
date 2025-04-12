
class Termsmodal {
  final String title;
  final String privacyPolicies;

  Termsmodal({
    required this.title,
    required this.privacyPolicies,
  });

  factory Termsmodal.fromJson(Map<String, dynamic> json) {
    return Termsmodal(
      title: json['title'],
      privacyPolicies: json['terms_conditions'],
    );
  }
}
