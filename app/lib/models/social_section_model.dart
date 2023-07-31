class SocialSection {
  final String? id;
  final String? name;

  SocialSection({
    this.id,
    this.name,
  });

  factory SocialSection.fromJson(Map<String, dynamic> json) => SocialSection(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
