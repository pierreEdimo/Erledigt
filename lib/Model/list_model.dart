class ListModel {
  final int? id;
  final String? name;
  final String? emojiUrl;

  final int? taskCount;

  ListModel({
    this.id,
    this.name,
    this.emojiUrl,
    this.taskCount,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        id: json['id'] as int,
        name: json['name'] as String,
        emojiUrl: json['emojiUrl'] as String,
        taskCount: json['taskCount'] as int,
      );
}
