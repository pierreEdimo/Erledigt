import 'package:erledigt/Model/register_model.dart';
import 'package:erledigt/Service/auth_service.dart';
import 'package:erledigt/Widgets/back_to_login.dart';
import 'package:erledigt/Widgets/display_dialog.dart';
import 'package:erledigt/Widgets/email.dart';
import 'package:erledigt/Widgets/password.dart';
import 'package:erledigt/Widgets/user_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
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
                  height: 10,
                ),
                userNameInput(_usernameController),
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
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      RegisterModel userModel = RegisterModel(
                        userName: _usernameController.text,
                        passWord: _passwordController.text,
                        email: _emailController.text,
                      );

                      var res = await context
                          .read<AuthService>()
                          .registerUser(userModel);

                      if (res == 200) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        displayDialog(context, "Error",
                            "Either your  Email or your password are already used , please try again with other ones");
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                backtoSignIn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
