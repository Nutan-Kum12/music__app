import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:app_3/appwrite/appwritecontrollers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final resetKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1A1C), 
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",
                        style: TextStyle(
                            fontSize:MediaQuery.of(context).size.height * 0.05,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        height: MediaQuery.of(context).size.height * 0.11,
                        child: TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? "Email cannot be empty." : null,
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Email",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
          
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        height: MediaQuery.of(context).size.height * 0.11,
                        child: TextFormField(
                          validator: (value) => value!.length < 8
                              ? "Password should have atleast 8 characters."
                              : null,
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Password",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("Reset Password",
                                            style: TextStyle(color: Colors.white)),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                "Please enter your email we will send a recovery link.",
                                                style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Form(
                                              key: resetKey,
                                              child: TextFormField(
                                                controller: resetController,
                                                validator: (value) => value!
                                                        .isEmpty
                                                    ? "Please enter a valid email."
                                                    : null,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  label: Text(
                                                    "Email",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel", style: TextStyle(color: Colors.white))),
                                          TextButton(
                                              onPressed: () {
                                                if (resetKey.currentState!
                                                    .validate()) {
                                                  sendRecoveryMail(
                                                          resetController.text)
                                                      .then((value) {
                                                    Navigator.pop(context);
                                                    if (value) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: Text(
                                                          "Recovery Mail Sent",
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                        backgroundColor: Colors
                                                            .green.shade400,
                                                      ));
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: Text(
                                                          "Cannot Send Recovery Mail",
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                        backgroundColor:
                                                            Colors.red.shade400,
                                                      ));
                                                    }
                                                  });
                                                }
                                              },
                                              child: Text("Send Link", style: TextStyle(color: Colors.white)))
                                        ],
                                      ));
                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.03
                              ),
                            
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * .9,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginUser(emailController.text,
                                        passwordController.text)
                                    .then((value) {
                                  if (value == "success") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Login Successful",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.orange,
                                    ));
                                    Navigator.pushReplacementNamed(
                                        context, "/home");
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
                              "Login",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),
                            ))),
                  
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have and account?",
                          style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.03),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/signup");
                            },
                            child: Text(
                              "Sign Up",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),
                              ),
                            )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
