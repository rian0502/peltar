import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:peltar/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int height = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginViewModel>(
        builder: (context, value, child) {
          return Container(
            child: ListView(
              children: [
                const SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 80,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Log In',
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: const Color(0xFF134A6E),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Log In with email and password\nto use your account',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: const Color(0xFF0093AD),
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      //input email
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: value.usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xFF134A6E),
                            ),
                            hintText: 'Username',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 20,
                              color: const Color(0xFF134A6E),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          obscureText: value.obscureText,
                          controller: value.passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFF134A6E),
                            ),
                            suffixIcon: value.obscureText == true
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Color(0xFF134A6E),
                                    ),
                                    onPressed: () {
                                      value.togglePasswordVisibility();
                                    },
                                  )
                                : IconButton(
                                    icon: const Icon(
                                      Icons.visibility_off,
                                      color: Color(0xFF134A6E),
                                    ),
                                    onPressed: () {
                                      value.togglePasswordVisibility();
                                    },
                                  ),
                            hintText: 'Password',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 20,
                              color: const Color(0xFF134A6E),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF134A6E),
                        ),
                        child: TextButton(
                          onPressed: () {
                            value.login(context);
                          },
                          child: value.loading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Log In',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
