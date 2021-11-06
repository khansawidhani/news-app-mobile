import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';
import 'package:news_app_flutter/app/modules/user_auth/local_widgets/utils.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  final GlobalKey signupFormKey = GlobalKey();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          // fit: StackFit.expand,
          children: [
            authScreenBg(context),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topHeading("Create Account", context),
                      subHeading("Signup to get started!", context),
                      spacer(40.0),
                      Form(
                          key: signupFormKey,
                          child: Column(
                            children: [
                              userNameInputField(_fullnameController),
                              spacer(15.0),
                              emailInputField(_emailController),
                              spacer(15.0),
                              passwordInputField(_passwordController),
                              spacer(15.0),
                              confirmPasswordInputField(
                                  _confirmPasswordController),
                            ],
                          )),
                      spacer(15.0),
                      submitFormButton("Create Account", () async {
                        controller.signup(
                          _fullnameController.text.trim(),
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          _confirmPasswordController.text.trim()
                        
                        );
                      }, context),
                      spacer(35.0),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: toggleLoginSignupText(context,
                            "Already a user? ", "Login here ", "/login"),
                      ), 
                      spacer(20.0),
                      orText(),
                      spacer(20.0),
                      Container(
                        alignment: Alignment.topCenter,
                        child: authWithGoogle(()async{controller.signInWithGoogle();}),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
