import 'package:hive/hive.dart';

part 'tsbih_model.g.dart';

@HiveType(typeId: 0)
class TsbihModel extends HiveObject {
  @HiveField(0)
  dynamic count;

  @HiveField(1)
  final String content;
  TsbihModel({required this.count, required this.content});
}
