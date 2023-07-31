class SocialConfig {
  final List<Filter>? filters;

  SocialConfig({
    this.filters,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialConfig &&
          runtimeType == other.runtimeType &&
          filters == other.filters;

  @override
  int get hashCode => filters.hashCode;

  factory SocialConfig.fromJson(Map<String, dynamic> json) => SocialConfig(
        filters:
            List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filters": List<dynamic>.from(filters!.map((x) => x.toJson())),
      };
}

class Filter {
  final String? tagId;
  final List<Section>? sections;
  final String? pinnedPublicationId;
  String? tagName;

  Filter({
    this.tagId,
    this.sections,
    this.pinnedPublicationId,
    this.tagName = '',
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        tagId: json["tagId"],
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"].map((x) => Section.fromJson(x))),
        pinnedPublicationId: json["pinnedPublicationId"],
      );

  Map<String, dynamic> toJson() => {
        "tagId": tagId,
        "sections": List<dynamic>.from(sections!.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Filter &&
          runtimeType == other.runtimeType &&
          tagName == other.tagName;

  @override
  int get hashCode => tagName.hashCode;
}

class Section {
  final String? pinnedPublicationId;
  final String? sectionId;

  Section({
    this.pinnedPublicationId,
    this.sectionId,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        pinnedPublicationId: json["pinnedPublicationId"],
        sectionId: json["sectionId"],
      );

  Map<String, dynamic> toJson() => {
        "pinnedPublicationId": pinnedPublicationId,
        "sectionId": sectionId,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Section &&
          runtimeType == other.runtimeType &&
          pinnedPublicationId == other.pinnedPublicationId;

  @override
  int get hashCode => pinnedPublicationId.hashCode;
}
