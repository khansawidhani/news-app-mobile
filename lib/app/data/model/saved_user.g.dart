// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedUserAdapter extends TypeAdapter<SavedUser> {
  @override
  final int typeId = 2;

  @override
  SavedUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedUser()
      ..uid = fields[0] as String
      ..isLoggedin = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, SavedUser obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.isLoggedin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
