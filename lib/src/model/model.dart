class ModelManga {
  String id;
  String title;
  String? desc;

  ModelManga({required this.id, required this.title, this.desc});

  // Factory method to create ModelManga from JSON
  factory ModelManga.fromJson(Map<String, dynamic> json) {
    return ModelManga(
      id: json['id'] as String,
      title: json['attributes']['title']['en'] as String,
      desc: json['attributes']['description']['en'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
    };
  }
}
