// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tsbih_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TsbihModelAdapter extends TypeAdapter<TsbihModel> {
  @override
  final int typeId = 0;

  @override
  TsbihModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TsbihModel(
      count: fields[0] as dynamic,
      content: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TsbihModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TsbihModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
