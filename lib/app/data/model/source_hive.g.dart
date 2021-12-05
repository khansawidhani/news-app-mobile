// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSourceAdapter extends TypeAdapter<HiveSource> {
  @override
  final int typeId = 0;

  @override
  HiveSource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSource()
      ..id = fields[0] as String?
      ..name = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, HiveSource obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
