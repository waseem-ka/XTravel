import 'package:bookingbus/api_url.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookingbus/screens/switcher.dart';
import 'package:bookingbus/api/api_provider.dart';
import 'package:bookingbus/constants/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

Map Token_Info = {};

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String message = "Welcome in XTravel customer application";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: tdGreen, title: const Text("Login")),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  Image.asset("assets/images/company_logo.png"),

                  // const Icon(
                  //   Icons.account_circle,
                  //   color: tdGreen,
                  //   size: 70,
                  // ),
                  const SizedBox(height: 60),
                  //Hello Again
                  // Text('Hello Again!',
                  //     style: GoogleFonts.bebasNeue(fontSize: 52, color: tdGreen)),
                  // const SizedBox(height: 50),
                  Center(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //User Name TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        // if (!(RegExp(
                        //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //     .hasMatch(value ?? ''))) {
                        //   return 'Email is not Correct';
                        // }
                        // return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelText: 'Email',
                        // labelStyle:
                        //     TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //Password TextField

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        // if ((value?.length ?? 0) > 10) {
                        //   return null;
                        // }
                        // return 'Password should be more than 10 characters';
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: 
                          const BorderRadius.all(Radius.circular(12)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor)
                           ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //sign in button______________________________________

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: Builder(
                        builder: (ctx) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(25),
                              backgroundColor: tdGreen),
                          onPressed: () async {
                            if (!(_formKey.currentState!.validate())) {
                              return;
                            }
                            message = 'validation success';
                            //
                            if (message == 'validation success') {
                              Token_Info = await APIProvider().login({
                                "username": _emailController.text,
                                "password": _passwordController.text
                              });
                              if (Token_Info["message"] == 'ok') {
                                // move to home page
                                print(Token_Info);
                                Navigator.of(ctx).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const Switcher()));
                                return;
                              } else {
                                message = Token_Info["message"];
                              }
                            }

                            ///
                            setState(() {});
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  //not a member?? Register now!_________________________________________

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member? Not Register !',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Need Help ?"),
                              content:
                                  const Text("Try Call Company in 0999999990"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    child: const Text(
                                      "okay",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          ' Call Company ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: tdGreen),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
