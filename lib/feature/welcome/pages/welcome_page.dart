import 'package:flutter/material.dart';
import 'package:whats/feature/welcome/widgets/privacy_and_terms.dart';

import '../../../common/utils/coloors.dart';
import '../../../generated/assets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloors.backgroundDark,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                Assets.imagesCircle,
                color: Coloors.greenDark,
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
                SizedBox(
                  height: 42,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Coloors.greenDark,
                      foregroundColor: Coloors.backgroundDark,
                      splashFactory: NoSplash.splashFactory,
                      //tip：去除水波纹效果
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text("AGREE AND CONTINUE"),
                  ),
                ),
                const SizedBox(height: 50),
                Material(
                  color: const Color(0xFF182229),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    // tip：添加点击事件
                    onTap: () {},
                    splashFactory: NoSplash.splashFactory,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.language,
                            color: Coloors.greenDark,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "English",
                            style: TextStyle(
                              color: Coloors.greenDark,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Coloors.greenDark,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
