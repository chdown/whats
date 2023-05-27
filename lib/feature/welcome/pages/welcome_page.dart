import 'package:flutter/material.dart';
import 'package:whats/common/extension/Custom_theme_extension.dart';
import 'package:whats/common/utils/coloors.dart';
import 'package:whats/common/widgets/custom_elevate_button.dart';
import 'package:whats/feature/welcome/widgets/privacy_and_terms.dart';
import 'package:whats/generated/assets.dart';

import 'language_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                Assets.imagesCircle,
                color: context.theme.circleImageColor,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "Welcome to WhatsApp",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const PrivacyAndTerms(),
                CustomElevateButton(
                  onPressed: () {},
                  text: "AGREE AND CONTINUE",
                ),
                const SizedBox(height: 50),
                const LanguageButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
