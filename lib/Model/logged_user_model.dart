class LoggedUser {
  final String? name;
  final String? id;
  final String? email;

  LoggedUser({
    this.email,
    this.id,
    this.name,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) => LoggedUser(
        name: json['userName'] as String,
        id: json['id'] as String,
        email: json['email'] as String,
      );
}
