import 'package:aapda_mitra/app_theme.dart';
import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message, {IconData? icon}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.transparent,
          margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 1,
          padding: EdgeInsets.zero,
          behavior: SnackBarBehavior.floating,
          content: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Wrap(
              children: [
                icon != null ? Icon(icon) : const SizedBox(),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  message,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          )),
    );
}
