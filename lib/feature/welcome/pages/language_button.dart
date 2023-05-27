import 'package:flutter/material.dart';
import 'package:whats/common/extension/Custom_theme_extension.dart';
import 'package:whats/common/utils/coloors.dart';
import 'package:whats/common/widgets/custom_icon_button.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({Key? key}) : super(key: key);

  showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  color: context.theme.greyColor!.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  CustomIconButton(
                    onTap: () => Navigator.of(context).pop(),
                    icon: Icons.close_outlined,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "App Language",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                color: context.theme.greyColor!.withOpacity(0.3),
                thickness: .5,
              ),
              RadioListTile(
                value: true,
                groupValue: true,
                onChanged: (value) {},
                activeColor: Coloors.greenDark,
                title: const Text("English"),
                subtitle: Text(
                  "(phone`s language)",
                  style: TextStyle(color: context.theme.greyColor),
                ),
              ),
              RadioListTile(
                value: false,
                groupValue: true,
                onChanged: (value) {},
                activeColor: Coloors.greenDark,
                title: const Text("simple chinese"),
                subtitle: Text(
                  "(语言)",
                  style: TextStyle(color: context.theme.greyColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        // tip：添加点击事件
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        highlightColor: context.theme.langBtnHighlightColor,
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
    );
  }
}
