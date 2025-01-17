import 'package:flutter/material.dart';
import 'package:fuelease/common/color_extention.dart';
import 'package:fuelease/common_widget/rounded_button.dart';
import 'package:fuelease/common_widget/rounded_textfield.dart';
import 'package:fuelease/src/login/view/newpassword_view.dart';


class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "Reset Password",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Please enter your email to receive a\n reset code to create a new password via email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              RoundTextfield(
                hintText: "Your Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                  title: "Send",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewPasswordView()));
                  }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //TODO: Action
  // void btnSubmit() {
  //   if (!txtEmail.text.isEmail) {
  //     mdShowAlert(Globs.appName, MSG.enterEmail, () {});
  //     return;
  //   }

  //   endEditing();

  //   serviceCallForgotRequest({
  //     "email": txtEmail.text
  //   });
}
