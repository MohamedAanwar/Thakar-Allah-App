class GodNamesModel {
  final String name;
  final String text;

  GodNamesModel({required this.name, required this.text});
  factory GodNamesModel.fromJson(json) {
    return GodNamesModel(name: json['name'], text: json['text']);
  }
}
