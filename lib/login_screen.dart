import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login Screen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.4,
            ),
            const Text(
              "Welcome Back!",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const Text(
              "Login to continue Radio App",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      fillColor: Colors.white,
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      fillColor: Colors.white,
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      checkColor: Colors.red,
                      activeColor: Colors.white,
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                const InkWell(child: Text("Forget password?")),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  print('Button tapped');
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff7A5FC9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5.0,
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            customButton(
              buttonColor: Colors.white,
              titleColor: Colors.black,
              buttonTitle: "Continue with Google",
              imageAsset: "assets/images/google_logo.png",
              onClick: () {},
            ),
            customButton(
              buttonColor: Colors.black,
              titleColor: Colors.white,
              buttonTitle: "Continue with Apple ID",
              imageAsset: "assets/images/apple_logo.png",
              onClick: () {},
            ),
            customButton(
              buttonColor: const Color(0xff3B5998),
              titleColor: Colors.white,
              buttonTitle: "Continue with Facebook ",
              imageAsset: "assets/images/facebook_logo.png",
              onClick: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    child:
                        Text("Sign up", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            const Text(
              "By signing up you indicate that you have read and",
              style: TextStyle(fontSize: 10),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "agreed to the patch",
                  style: TextStyle(fontSize: 10),
                ),
                Text("Terms of Service",
                    style: TextStyle(color: Colors.blue, fontSize: 10))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.4,
            ),
          ],
        ),
      ),
    );
  }

  customButton(
      {required Color buttonColor,
      required Color titleColor,
      required String buttonTitle,
      required String imageAsset,
      required Function()? onClick}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
            ),

            elevation: 5.0, //for the shadow
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset,
                height: 24.0, // Adjust the height as needed
                width: 24.0, // Adjust the width as needed
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                buttonTitle,
                style: TextStyle(color: titleColor, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


