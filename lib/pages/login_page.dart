import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/contants/app_contants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Center(
                      child: Text(
                        "Hello again!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: const Text(
                        "Wellcome back you've been missed!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _customTextfield(hint: "Enter username"),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _customTextfield(
                        hint: "Password",
                        isPassword: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text("Recovery Password"),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: AppConstants.btnColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _customContainer(context),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Or continue with"),
                        ),
                        _customContainer(context, reversed: true)
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _customImageItem(imagePath: "assets/images/google.png"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: _customImageItem(
                              imagePath: "assets/images/aple.png"),
                        ),
                        _customImageItem(
                            imagePath: "assets/images/facebook.webp"),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member ?"),
                SizedBox(width: 10),
                Text(
                  "Register now",
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _customImageItem({required String imagePath}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
      ),
      child: Image.asset(
        imagePath,
        height: 25,
        width: 25,
      ),
    );
  }

  _customContainer(context, {bool reversed = false}) {
    return Container(
      height: 2,
      width: MediaQuery.of(context).size.width * .2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: reversed
            ? const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.transparent,
                ],
              )
            : const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.grey,
                ],
              ),
      ),
    );
  }

  _customTextfield({required String? hint, bool isPassword = false}) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
