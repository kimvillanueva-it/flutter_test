class Hit {
  int id;
  String previewURL;

  Hit(this.id, this.previewURL);

  factory Hit.fromJson(dynamic json) {
    return Hit(json['id'] as int, json['previewURL'] as String);
  }

  int getId() => id;
  String getPreviewURL() => previewURL;
}
