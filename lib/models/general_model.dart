class GeneralModel {
  final String? text;
  final String? label;
  final String? number;
  final String? hint;
  final int? rnumber;

  GeneralModel({
    this.text,
    this.label,
    this.number,
    this.hint,
    this.rnumber,
  });
  factory GeneralModel.fromJsonText(json) {
    return GeneralModel(text: json['text'], rnumber: 1);
  }
  factory GeneralModel.fromJsonText_label_number(json) {
    return GeneralModel(
        text: json['text'],
        label: json['label'],
        number: json['number'],
        rnumber: 1);
  }
  factory GeneralModel.fromJsonText_number_hint(json) {
    return GeneralModel(
        text: json['text'], hint: json['hint'], rnumber: json['number']);
  }
}
