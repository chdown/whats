import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whats/common/extension/Custom_theme_extension.dart';
import 'package:whats/common/helper/show_alert_dialog.dart';
import 'package:whats/common/utils/coloors.dart';
import 'package:whats/common/widgets/custom_elevate_button.dart';
import '../../../common/widgets/custom_icon_button.dart';
import 'package:whats/feature/auth/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    countryNameController = TextEditingController(text: "Ethiopia");
    countryCodeController = TextEditingController(text: "251");
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ["ET"],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(
          color: context.theme.greyColor,
        ),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(
            color: context.theme.greyColor,
          ),
          prefixIcon: const Icon(
            Icons.language,
            color: Coloors.greenDark,
          ),
          hintText: "Search country code or name",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(0.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Coloors.greenDark),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  sendCodeToPhone() {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;
    if (phone.isEmpty) {
      return showAlertDialog(
        context: context,
        message: "Please entered you phone number",
      );
    }
    if (phone.length < 9) {
      return showAlertDialog(
        context: context,
        message: "The phone number you entered is too short for the country : $name.\n\n Include you area code if you haven`t",
      );
    }else if (phone.length > 10) {
      return showAlertDialog(
        context: context,
        message: "The phone number you entered is too long for the country : $name.\n\n Include you area code if you haven`t",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Enter your phone number",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "WhatsApp will need to verify your phone number. ",
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: "what`s my number?",
                      style: TextStyle(
                        color: context.theme.blueColor,
                      ),
                    )
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              onTap: showCountryCodePicker,
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: showCountryCodePicker,
                    controller: countryCodeController,
                    prefixText: "+",
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  readOnly: false,
                  hintText: "phone number",
                  controller: phoneNumberController,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Carrier charges my apply",
            style: TextStyle(color: context.theme.greyColor),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevateButton(
        onPressed: sendCodeToPhone,
        text: "Next",
        buttonWidth: 90,
      ),
    );
  }
}
