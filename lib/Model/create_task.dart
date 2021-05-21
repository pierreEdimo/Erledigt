class CreateTask {
  final int? listId;
  final String? taskName;
  final bool? isComplete;
  final String? userId;
  final bool? isImportant;

  CreateTask(
      {this.listId,
      this.taskName,
      this.isComplete,
      this.isImportant,
      this.userId});

  factory CreateTask.fromJson(Map<String, dynamic> json) => CreateTask(
        listId: json['listId'] as int,
        taskName: json['taskName'] as String,
        isComplete: json['isComplete'] as bool,
        isImportant: json['isImportant'] as bool,
        userId: json['userId'] as String,
      );

  Map<String, dynamic> toJson() => {
        "listId": listId,
        "taskName": taskName,
        "isComplete": isComplete,
        "isImportant": isImportant,
        "userId": userId
      };
}
