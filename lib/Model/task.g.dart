// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      taskName: fields[0] as String?,
      isComplete: fields[1] as bool?,
      reminderTime: fields[2] as DateTime?,
      isImportant: fields[3] as bool?,
      additionalNote: fields[5] as String?,
      listKey: fields[6] as int?,
      reminderHour: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.isComplete)
      ..writeByte(2)
      ..write(obj.reminderTime)
      ..writeByte(3)
      ..write(obj.isImportant)
      ..writeByte(5)
      ..write(obj.additionalNote)
      ..writeByte(6)
      ..write(obj.listKey)
      ..writeByte(7)
      ..write(obj.reminderHour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
