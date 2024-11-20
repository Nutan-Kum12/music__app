
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:app_3/appwrite/appwritecontrollers.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Sign Up",
                  style: TextStyle(
                      fontSize:MediaQuery.of(context).size.height * 0.06, fontWeight: FontWeight.w600)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Name cannot be empty." : null,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                  )),
           
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Email cannot be empty." : null,
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                    ),
                  )),
             
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: TextFormField(
                    validator: (value) => value!.length < 8
                        ? "Password should have atleast 8 characters."
                        : null,
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                    ),
                  )),
            
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          createUser(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text)
                              .then((value) {
                            if (value == "success") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Account Created Successfully",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.orange,
                              ));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red.shade400,
                              ));
                            }
                          });
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),
                      ))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // SizedBox(
              //   height: 65,
              //   width: MediaQuery.of(context).size.width * .9,
              //   child: OutlinedButton(
              //       onPressed: () {
              //         // continueWithGoogle().then((value) {
              //         //   if (value) {
              //         //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         //       content: Text(
              //         //         "Google Login Successful",
              //         //         style: TextStyle(color: Colors.white),
              //         //       ),
              //         //       backgroundColor: Colors.green.shade400,
              //         //     ));
              //         //     Navigator.pushReplacementNamed(context, "/home");
              //         //   } else {
              //         //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         //       content: Text(
              //         //         "Google Login Failed",
              //         //         style: TextStyle(color: Colors.white),
              //         //       ),
              //         //       backgroundColor: Colors.red.shade400,
              //         //     ));
              //           // }
              //         // });
              //       },
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Image.asset(
              //             "assets/images/google.png",
              //             height: 30,
              //             width: 30,
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             "Continue with Google",
              //             style: TextStyle(fontSize: 16),
              //           )
              //         ],
              //       )),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.018,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have and account?",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Login",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}