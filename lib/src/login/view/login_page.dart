// import 'package:flutter/material.dart';
// import 'package:fuelease/common/color_extention.dart';
// import 'package:fuelease/common_widget/rounded_button.dart';
// import 'package:fuelease/common_widget/rounded_icon_button.dart';
// import 'package:fuelease/common_widget/rounded_textfield.dart';
// import 'package:fuelease/src/login/view/reset_password__view.dart';
// import 'package:fuelease/src/login/view/signup_view.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   TextEditingController txtEmail = TextEditingController();
//   TextEditingController txtPassword = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 64,
//             ),
//             Text(
//               "Login",
//               style: TextStyle(
//                   color: TColor.primaryText,
//                   fontSize: 30,
//                   fontWeight: FontWeight.w800),
//             ),
//             Text(
//               "Add your details to login",
//               style: TextStyle(
//                   color: TColor.secondaryText,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
            
//             const SizedBox(
//               height: 25,
//             ),
//             RoundTextfield(
//               hintText: "Your Email",
//               controller: txtEmail,
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             RoundTextfield(

//               hintText: "Password",
//               controller: txtPassword,
//               obscureText: true,
//             ),

//             const SizedBox(
//               height: 20,
//             ),
//             RoundButton(
//                 title: "Login",
//                 onPressed: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => const OnBoardingView(),
//                   //   ),
//                   // );
//                 }),
//             const SizedBox(
//               height: 20,
//             ),

//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (contex) => ResetPasswordView(),
//                   ),
//                 );
//               },
//               child: Text(
//                 "Forgot your password?",
//                 style: TextStyle(
//                     color: TColor.secondaryText,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),

//             Text(
//               "or Login With",
//               style: TextStyle(
//                   color: TColor.secondaryText,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500),
//             ),

//             const SizedBox(
//               height: 30,
//             ),
//             RoundIconButton(
//               icon: "assets/images/facebook_logo.png",
//               title: "Login with Facebook",
//               color: const Color(0xff367FC0),
//               onPressed: () {},
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             RoundIconButton(
//               icon: "assets/images/google_logo.png",
//               title: "Login with Google",
//               color: const Color(0xffDD4B39),
//               onPressed: () {},
//             ),

//             const SizedBox(
//               height: 80,
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const SignUpView(),
//                   ),
//                 );
//               },
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Don't have an Account?",
//                     style: TextStyle(
//                         color: TColor.secondaryText,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     "Sign Up",
//                     style: TextStyle(
//                         color: TColor.primary,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:fuelease/src/login/controllers/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:fuelease/common/color_extention.dart';
import 'package:fuelease/common_widget/rounded_button.dart';
import 'package:fuelease/common_widget/rounded_icon_button.dart';
import 'package:fuelease/common_widget/rounded_textfield.dart';
import 'package:fuelease/src/login/view/reset_password__view.dart';
import 'package:fuelease/src/login/view/signup_view.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    // Accessing the provider to read authentication status and potential errors
    final authProvider = Provider.of<AuthServiceProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Center(
                child: Image.asset("assets/images/logo.jpeg",
             

                ),
              ),
              Text(
                "Login",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Add your details to login",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Your Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Password",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),

              // Show error message if login fails
              if (authProvider.currentUser == null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Login failed. Please check your credentials.", // Customize error message as per logic
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),

              RoundButton(
                title: "Login",
                onPressed: () async {
                  // Trigger login logic when pressed
                  await loginUser(authProvider);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordView(),
                    ),
                  );
                },
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "or Login With",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundIconButton(
                icon: "assets/images/facebook_logo.png",
                title: "Login with Facebook",
                color: const Color(0xff367FC0),
                onPressed: () {},
              ),
              const SizedBox(
                height: 25,
              ),
              RoundIconButton(
                icon: "assets/images/google_logo.png",
                title: "Login with Google",
                color: const Color(0xffDD4B39),
                onPressed: () {},
              ),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to handle login
  Future<void> loginUser(AuthServiceProvider authProvider) async {
    final email = txtEmail.text.trim();
    final password = txtPassword.text.trim();

    try {
      final user =
          await authProvider.loginUserWithEmailAndPassword(email, password);

      if (user != null) {
        // Navigate to Home Page or Dashboard
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Automatically update the UI using Provider if login fails
        // Provider will notifyListeners and UI will respond
      }
    } catch (e) {
      // Handle login error here if needed (UI will respond automatically to Provider's updates)
      debugPrint("Error logging in: ${e.toString()}");
    }
  }
}
