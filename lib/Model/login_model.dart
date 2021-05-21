class LoginModel {
  final String? email;
  final String? passWord;

  LoginModel({
    this.email,
    this.passWord,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json['email'] as String,
        passWord: json['passWord'] as String,
      );

  Map<String, dynamic> toJson() => {"email": email, "passWord": passWord};
}
