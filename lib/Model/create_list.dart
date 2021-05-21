class CreateList {
  final String? userId;
  final String? emojiUrl;
  final String? name;

  CreateList({
    this.emojiUrl,
    this.name,
    this.userId,
  });

  factory CreateList.fromJson(Map<String, dynamic> json) => CreateList(
        emojiUrl: json['emojiUrl'] as String,
        name: json['name'] as String,
        userId: json['userId'] as String,
      );

  Map<String, dynamic> toJson() => {
        "emojiUrl": emojiUrl,
        "name": name,
        "userId": userId,
      };
}
