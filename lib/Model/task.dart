import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  late String? taskName;

  @HiveField(1)
  late bool? isComplete;

  @HiveField(2)
  late DateTime? reminderTime;

  @HiveField(3)
  late bool? isImportant;

  @HiveField(5)
  late String? additionalNote;

  @HiveField(6)
  late int? listKey;

  @HiveField(7)
  late String? reminderHour;

  Task({
    this.taskName,
    this.isComplete,
    this.reminderTime,
    this.isImportant,
    this.additionalNote,
    this.listKey,
    this.reminderHour,
  });
}
