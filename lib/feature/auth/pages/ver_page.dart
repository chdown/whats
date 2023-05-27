import 'package:flutter/material.dart';
import 'package:whats/common/extension/Custom_theme_extension.dart';
import 'package:whats/common/widgets/custom_icon_button.dart';
import 'package:whats/feature/auth/widgets/custom_text_field.dart';

class VerPage extends StatefulWidget {
  const VerPage({Key? key}) : super(key: key);

  @override
  State<VerPage> createState() => _VerPageState();
}

class _VerPageState extends State<VerPage> {
  late TextEditingController codeController;

  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "verify you number",
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(text: "You`ve tried to register +2510912345678. before requesting an Sms with you code\n"),
                    TextSpan(
                        text: "Wrong number?",
                        style: TextStyle(
                          color: context.theme.blueColor,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                controller: codeController,
                hintText: "- - - - - -",
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Enter 6-digit code",
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Resend SMS",
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                ),
              ],
            ),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.2),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "Call Me",
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
