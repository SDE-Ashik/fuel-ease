import 'package:flutter/material.dart';
import 'package:fuelease/common/color_extention.dart';
import 'package:fuelease/common_widget/rounded_textfield.dart';
import 'package:fuelease/src/home/controller/home_notifer.dart';
import 'package:fuelease/src/home/views/widget/baaner.dart';
import 'package:fuelease/src/home/views/widget/navigation_bar.dart';
import 'package:fuelease/src/login/controllers/auth_controller.dart';
import 'package:fuelease/src/models/user_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserModel userModel = UserModel();
  TextEditingController txtSearch = TextEditingController();

 
  
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceProvider>(builder: (context, notifer, child) {
      return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<String?>(
                      future: userModel.getUserName(),
                      builder: (context, snapshot) {
                        // Get time-based greeting from HomeNotifer
                        String greeting = HomeNotifer.getGreeting();

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text(
                            greeting,
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                            "Error loading name",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          );
                        } else if (snapshot.hasData && snapshot.data != null) {
                          return Text(
                            "$greeting, ${snapshot.data}!",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          );
                        } else {
                          return Text(
                            "$greeting!",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          );
                        }
                      },
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/shopping_cart (1).png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivering to",
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 11),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {
                        // Handle location selection
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Current Location",
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 25),
                          Image.asset(
                            "assets/images/location.png",
                            width: 12,
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Fuel",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/images/search (1).png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
             
            

             
            ]),
          ),
        ),
        bottomNavigationBar:NavigationBarWidget(),
      );
    });
  }
}
