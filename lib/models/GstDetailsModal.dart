class AppSetting {
  final int id;
  final String key;
  final String value;
  final String updatedAt;

  AppSetting({
    required this.id,
    required this.key,
    required this.value,
    required this.updatedAt,
  });

  factory AppSetting.fromJson(Map<String, dynamic> json) {
    return AppSetting(
      id: json['id'],
      key: json['key'],
      value: json['value'],
      updatedAt: json['updated_at'],
    );
  }
}