import 'package:aapda_mitra/app_theme.dart';
import 'package:aapda_mitra/core/common/custom_buttons.dart';
import 'package:aapda_mitra/core/common/custom_textfield.dart';
import 'package:aapda_mitra/core/constants/app_routes.dart';
import 'package:aapda_mitra/core/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //Obscured
  bool _passwordObscured = true;
  bool _passwordConfirmObscured = true;

  //TextEditingController
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //Focus Node
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

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
                "Sign up",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                        fontFamily: AppTheme.secondaryFont,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppTheme.primaryColor),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: 160,
                          height: 54,
                          child: TextField(
                            controller: firstNameController,
                            focusNode: firstNameFocusNode,
                            onEditingComplete: () {
                              firstNameFocusNode.unfocus();
                              lastNameFocusNode.requestFocus();
                            },
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xFF4F4F4F)),
                            decoration: const InputDecoration(
                              hintText: "First Name",
                              hintStyle: TextStyle(
                                fontFamily: AppTheme.secondaryFont,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF4F4F4F),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFD8DADC),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFD8DADC),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: SizedBox(
                          width: 150,
                          height: 54,
                          child: TextField(
                            controller: lastNameController,
                            focusNode: lastNameFocusNode,
                            onEditingComplete: () {
                              lastNameFocusNode.unfocus();
                              emailFocusNode.requestFocus();
                            },
                            decoration: const InputDecoration(
                              hintText: "Last Name",
                              hintStyle: TextStyle(
                                fontFamily: AppTheme.secondaryFont,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF4F4F4F),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFD8DADC),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFD8DADC),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                customLabel: "Email",
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
                customLabel: "Create a password",
                hintText: "must be 8 characters",
                controller: passwordController,
                focusNode: passwordFocusNode,
                onEditingComplete: () {
                  passwordFocusNode.unfocus();
                  confirmPasswordFocusNode.requestFocus();
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
                height: 25,
              ),
              CustomTextfield(
                customLabel: "Confirm password",
                hintText: "Re-enter password",
                controller: confirmPasswordController,
                focusNode: confirmPasswordFocusNode,
                onEditingComplete: () {
                  confirmPasswordFocusNode.unfocus();
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordConfirmObscured = !_passwordConfirmObscured;
                    });
                  },
                  icon: _passwordConfirmObscured
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  color: const Color(0xFF4F4F4F),
                ),
                obscureText: _passwordConfirmObscured,
              ),
              const SizedBox(
                height: 35,
              ),
              const Center(
                child: CustomPrimaryButton(
                  buttonText: "Register",
                  buttonWidth: 400,
                  margin: EdgeInsets.zero,
                  buttonHeight: 54,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildOtherRegister()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtherRegister() {
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
              'Or Register with',
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
            width: 100,
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
              text: "Already have an account?",
              style: TextStyle(
                fontFamily: AppTheme.secondaryFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              )),
          TextSpan(
              text: " Log in",
              style: const TextStyle(
                fontFamily: AppTheme.secondaryFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppTheme.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.go(Routes.loginInPageRoute)),
        ]))
      ],
    );
  }
}
