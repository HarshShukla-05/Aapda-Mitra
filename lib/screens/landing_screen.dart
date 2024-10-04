import 'package:aapda_mitra/app_theme.dart';
import 'package:aapda_mitra/core/common/custom_buttons.dart';
import 'package:aapda_mitra/core/constants/app_routes.dart';
import 'package:aapda_mitra/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(73, 174, 192, 1),
            Color.fromRGBO(53, 138, 159, 1)
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      Constants.appLogo,
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "ARE YOU?",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      fontFamily: AppTheme.tertiaryFont,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPrimaryButton(
                    buttonText: "CITIZEN",
                    buttonBackgroundColor: Colors.white,
                    textColor: Colors.black,
                    onPressed: () => context.go(Routes.singUpPageRoute),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPrimaryButton(
                    buttonText: "AGENCY",
                    buttonBackgroundColor: Colors.transparent,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.8),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.transparent),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
