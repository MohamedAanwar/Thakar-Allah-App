class AzkarModel {
  final String catname;
  dynamic count;
  final String desc;
  final String ref;
  final String content;
  dynamic counter;

  AzkarModel(
      {required this.catname,
      required this.count,
      required this.desc,
      required this.ref,
      required this.content,
      this.counter});
  factory AzkarModel.fromJson(json) {
    return AzkarModel(
        catname: json['category'],
        count: int.parse(json['count']),
        desc: json['description'],
        ref: json['reference'],
        content: json['content'],
        counter: int.parse(json['count']));
  }
  factory AzkarModel.fromJsonRoqia(json) {
    return AzkarModel(
        catname: json['hint'],
        count: json['number'],
        desc: "",
        ref: "",
        content: json['text'],
        counter: json['number']);
  }

  void dec() {
    if (counter > 0) {
      counter--;
    }
  }
}
