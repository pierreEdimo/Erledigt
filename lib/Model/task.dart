class Task {
  final int? id;
  final String? taskName;
  final bool? isComplete;
  final String? reminderTime;
  final int? notesCount;
  final bool? isImportant;
  final int? listId;

  Task({
    this.id,
    this.taskName,
    this.isComplete,
    this.reminderTime,
    this.notesCount,
    this.isImportant,
    this.listId,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as int,
        taskName: json['taskName'] as String,
        isComplete: json['isComplete'] as bool,
        reminderTime: json['reminderTime'] as String,
        notesCount: json['notesCount'] as int,
        isImportant: json['isImportant'] as bool,
        listId: json['listId'] as int,
      );
}
