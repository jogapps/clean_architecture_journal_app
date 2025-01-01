// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalEntryModelAdapter extends TypeAdapter<JournalEntryModel> {
  @override
  final int typeId = 0;

  @override
  JournalEntryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JournalEntryModel(
      content: fields[0] as String,
      mood: fields[1] as String,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, JournalEntryModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.mood)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalEntryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
