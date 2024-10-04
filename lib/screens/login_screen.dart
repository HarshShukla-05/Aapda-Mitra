import 'package:aapda_mitra/app_theme.dart';
import 'package:aapda_mitra/core/common/custom_buttons.dart';
import 'package:aapda_mitra/core/common/custom_textfield.dart';
import 'package:aapda_mitra/core/constants/app_routes.dart';
import 'package:aapda_mitra/core/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Obscured
  bool _passwordObscured = true;

  // TextEditingController
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // FocusNode
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  Constants.starIcon,
                  height: 40,
                ),
              ),
              const Text(
                "Log in",
                style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontFamily: AppTheme.tertiaryFont,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextfield(
                customLabel: "Email address",
                hintText: "example@gmail.com",
                controller: emailController,
                focusNode: emailFocusNode,
                onEditingComplete: () {
                  emailFocusNode.unfocus();
                  passwordFocusNode.requestFocus();
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextfield(
                customLabel: "Password",
                hintText: "Password",
                controller: passwordController,
                focusNode: passwordFocusNode,
                onEditingComplete: () {
                  passwordFocusNode.unfocus();
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordObscured = !_passwordObscured;
                    });
                  },
                  icon: _passwordObscured
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  color: const Color(0xFF4F4F4F),
                ),
                obscureText: _passwordObscured,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontFamily: AppTheme.secondaryFont,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CustomPrimaryButton(
                  buttonText: "Log in",
                  buttonWidth: 400,
                  margin: EdgeInsets.zero,
                  buttonHeight: 54,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildOtherLogin()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Divider(
                color: Color(0xFFD8DADC),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'Or Login with',
              style: TextStyle(
                fontFamily: AppTheme.secondaryFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: Divider(
                color: Color(0xFFD8DADC),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: SizedBox(
            width: 190,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: const Color(0xFFD8DADC)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            Constants.googleIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: const Color(0xFFD8DADC)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            Constants.facebookIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
            text: TextSpan(children: [
          const TextSpan(
              text: "Don't have an account?",
              style: TextStyle(
                fontFamily: AppTheme.secondaryFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              )),
          TextSpan(
              text: " Sign up",
              style: const TextStyle(
                fontFamily: AppTheme.secondaryFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppTheme.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.go(Routes.singUpPageRoute)),
        ]))
      ],
    );
  }
}
