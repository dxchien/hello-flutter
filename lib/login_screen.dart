import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_button.dart';
import 'package:flutter_app/utils/app_rich_text.dart';
import 'package:flutter_app/utils/app_input_group.dart';
import 'package:flutter_app/utils/app_text_divider.dart';
import 'package:flutter_app/utils/app_textbtn.dart';
import 'package:flutter_app/utils/app_text_field.dart';
import 'package:flutter_app/utils/system.dart';

class LoginScreen extends StatefulWidget {
  final String title;

  const LoginScreen({Key? key, required this.title}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, child: Image.asset("assets/ellipse.png")),
          Positioned(
              top: 0, left: 0, child: Image.asset("assets/ellipse2.png")),
          Positioned(
              top: 0, right: 0, child: Image.asset("assets/ellipse3.png")),
          buildBody(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () {
        hideKeyboard();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 32, top: 128, right: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 32),
              appInputGroup(
                  label: "Email",
                  wg: appTextField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Your email or phone")),
              const SizedBox(height: 12),
              appInputGroup(
                  label: "Password",
                  wg: appTextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      suffixIcon: Icons.remove_red_eye,
                      hintText: "Your password",
                      onTapSuffixIcon: showHidePassword)),
              const SizedBox(height: 16),
              appTextButton(
                text: "Forgot password",
                action: forgotPasswordAction,
              ),
              const SizedBox(height: 16),
              appButton(
                text: "LOGIN",
                action: loginAction,
              ),
              const SizedBox(height: 16),
              appRichText(
                text: "Don’t have an account? ",
                link: "Sign Up",
                action: signupAction,
              ),
              const SizedBox(height: 64),
              appTextDivider("Sign in with"),
              const SizedBox(height: 16),
              socialLogin(),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialLogin() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: appButton(
            text: "FACEBOOK",
            textColor: 0xFF000000,
            color: 0xFFFFFFFF,
            prefixImage: "assets/facebook.png",
            action: facebookAction,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: appButton(
            text: "GOOGLE",
            textColor: 0xFF000000,
            color: 0xFFFFFFFF,
            prefixImage: "assets/google.png",
            action: googleAction,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  void forgotPasswordAction() {
    print('_LoginScreenState.forgotPasswordAction');
  }

  void loginAction() {
    print('_LoginScreenState.loginAction');
  }

  void signupAction() {
    print('_LoginScreenState.signupAction');
  }

  void showHidePassword() {
    print('_LoginScreenState.showHidePassword');
  }

  void facebookAction() {
    print('_LoginScreenState.facebookAction');
  }

  void googleAction() {
    print('_LoginScreenState.googleAction');
  }
}
