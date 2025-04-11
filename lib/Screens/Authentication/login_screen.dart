import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techqrmaintance/Screens/Authentication/signup_screen.dart';
import 'package:techqrmaintance/Screens/Widgets/custom_button.dart';
import 'package:techqrmaintance/Screens/Widgets/custom_textfield.dart';
import 'package:techqrmaintance/Screens/Widgets/page_route_animation.dart';
import 'package:techqrmaintance/Screens/Widgets/snakbar_widget.dart';
import 'package:techqrmaintance/Screens/area_manager/manager_home/manager_home_screen.dart';
import 'package:techqrmaintance/Screens/home/home.dart';
import 'package:techqrmaintance/application/logbloc/logbloc_bloc.dart';
import 'package:techqrmaintance/core/colors.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: 428,
              height: 280,
              decoration: BoxDecoration(
                  color: primaryBlue, // Hexadecimal color code
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        80), // Adjust this value to match the corner curve
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/loginimage.png'))),
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextField(
              hintText: 'Email',
              controller: emailController,
              curveRadius: 30,
              boolVal: false,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Password',
              controller: passwordController,
              curveRadius: 30,
              boolVal: false,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('Forgot password?')],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            BlocListener<LogblocBloc, LogblocState>(listener: (context, state) {
              if (state.isFailure) {
                CustomSnackbar.shows(
                  context,
                  message: "Oops! Something went wrong. Please try again.",
                );
              } else if (state.isSuccess) {
                // Navigate to the home screen
                if (state.userModelLists.role == "Technician") {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRoute(Home()),
                    (route) => false,
                  );
                }
                if (state.userModelLists.role == "Area Manager") {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRoute(ManagerHomeScreen()),
                    (route) => false,
                  );
                }
              }
            }, child: BlocBuilder<LogblocBloc, LogblocState>(
              builder: (context, state) {
                return state.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomMaterialButton(
                        key: Key('loginButton'),
                        text: 'Login',
                        onPressed: state.isLoading == true
                            ? () {}
                            : () {
                                final email = emailController.text.trim();
                                final password = passwordController.text.trim();
                                // Validate the email and password
                                if (email.isEmpty || password.isEmpty) {
                                  CustomSnackbar.shows(
                                    context,
                                    message:
                                        "Please enter valid email and password",
                                  );
                                  return;
                                } else if (email.isEmpty) {
                                  CustomSnackbar.shows(
                                    context,
                                    message: "Please enter valid email",
                                  );
                                  return;
                                } else if (password.isEmpty) {
                                  CustomSnackbar.shows(
                                    context,
                                    message: "Please enter valid password",
                                  );
                                  return;
                                }
                                if (password.isNotEmpty && email.isNotEmpty) {
                                  Future<void> storeCredentials(
                                      String email, String password) async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('email', email);
                                    await prefs.setString('password', password);
                                    log("saving completed succefully");
                                  }

                                  storeCredentials(email, password);
                                }
                                context.read<LogblocBloc>().add(
                                      LogblocEvent.login(email: email),
                                    );
                              },
                      );
              },
            )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an account ? '),
                GestureDetector(
                    onTap: () {
                      // Navigate to the signup screen
                      Navigator.of(context).push(createRoute(SignupScreen()));
                    },
                    child: Text('Signup')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
