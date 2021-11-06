import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

// spacer for sizing
SizedBox spacer(double height) {
  return SizedBox(height: height);
}

// user auth screens background
SizedBox authScreenBg(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Image(
      image: const AssetImage(
        "assets/images/bg.jpg",
      ),
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.7),
      colorBlendMode: BlendMode.darken,
    ),
  );
}

// user auth screens heading
Text topHeading(String text, context) {
  return Text(
    text,
    style: Theme.of(context).textTheme.headline1,
  );
}

// user auth screens sub heading
Text subHeading(String text, context) {
  return Text(
    text,
    style: Theme.of(context).textTheme.subtitle1,
  );
}

// form input fields
const TextStyle inputStyle = TextStyle(fontSize: 16.0, color: Colors.white);
// username field
TextFormField userNameInputField(TextEditingController _controller) {
  return TextFormField(
    controller: _controller,
    style: inputStyle,
    decoration:
        const InputDecoration(hintText: "Username", labelText: "Username"),
  );
}

// user email field
TextFormField emailInputField(TextEditingController _controller) {
  return TextFormField(
    controller: _controller,
    style: inputStyle,
    decoration: const InputDecoration(hintText: "Email", labelText: "Email"),
  );
}

// password field
TextFormField passwordInputField(TextEditingController _controller) {
  return TextFormField(
    controller: _controller,
    obscureText: true,
    style: inputStyle,
    decoration:
        const InputDecoration(hintText: "Password", labelText: "Password"),
  );
}

// confirm password field
TextFormField confirmPasswordInputField(TextEditingController _controller) {
  return TextFormField(
    controller: _controller,
    obscureText: true,
    style: inputStyle,
    decoration: const InputDecoration(
        hintText: "Confirm Password", labelText: "Confirm Password"),
  );
}

// form submit button
submitFormButton(String text, onPressed, context) {
  return Container(
    alignment: Alignment.topCenter,
    child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        )),
  );
}

// text to navigate between login and signup screen
toggleLoginSignupText(context, String text, String subText, String routePath) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 15.0,
        )),
    TextSpan(
        text: subText,
        style: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
            fontSize: 15.0),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.pushNamed(context, routePath);
          }),
  ]));
}

orText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const[
    Expanded(child: Divider(indent: 5.0, endIndent: 8.0, color: Colors.white70, thickness: 1.5,)),
    Text(
      'OR',
      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
    ),
    Expanded(child: Divider(indent: 8.0, endIndent: 5.0, color: Colors.white70, thickness: 1.5,))
  ]);
}

authWithGoogle(onPressed) {
  return SignInButton(
    Buttons.GoogleDark,
    onPressed: onPressed,
    text: "Continue with Google",
  );
  // ElevatedButton(onPressed: onPressed, child: const Text("Signin With Google"));
}
