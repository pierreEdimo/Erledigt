import 'package:erledigt/Model/login_model.dart';
import 'package:erledigt/Service/auth_service.dart';
import 'package:erledigt/Widgets/display_dialog.dart';
import 'package:erledigt/Widgets/email.dart';
import 'package:erledigt/Widgets/go_to_logup.dart';
import 'package:erledigt/Widgets/password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              emailInput(_emailController),
              SizedBox(
                height: 10,
              ),
              passwordInput(_passwordController),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red.shade600),
                  padding: EdgeInsets.all(15.0),
                  width: 150,
                  child: Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    LoginModel loginModel = LoginModel(
                        email: _emailController.text,
                        passWord: _passwordController.text);

                    var jwt =
                        await context.read<AuthService>().loginUser(loginModel);

                    if (jwt == 200) {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      displayDialog(context, "Error",
                          "Neither E-mail or password was found in our database, please try again ");
                    }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              gotoSignUp(context),
            ],
          ),
        ),
      ),
    );
  }
}
