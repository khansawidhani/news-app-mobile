import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/global/widgets/utils.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';
import 'package:news_app_flutter/app/modules/user_auth/local_widgets/auth_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey loginFormKey = GlobalKey();
  final controller = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      topHeading("Welcome back", context),
                      subHeading("Please signin to continue!", context),
                      spacer(40.0),
                      Form(
                          key: loginFormKey,
                          child: Column(
                            children: [
                              emailInputField(_emailController),
                              spacer(15.0),
                              passwordInputField(_passwordController),
                            ],
                          )),
                      spacer(15.0),
                      submitFormButton(
                          "Login",
                          ()async{
                          controller.login(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                          },
                          context),
                      spacer(35.0),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: toggleLoginSignupText(
                            context, "Not a user? ", "Signup here ", "/signup"),
                      ),
                      spacer(20.0),
                      orText(),
                      spacer(20.0),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        alignment: Alignment.bottomCenter,
                        child: authWithGoogle(()async{
                          controller.signInWithGoogle();
                        })
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
