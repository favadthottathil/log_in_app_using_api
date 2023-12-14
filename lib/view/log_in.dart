import 'package:flutter/material.dart';
import 'package:machine_test/Auth/sign_up.dart';
import 'package:machine_test/utils/sized_box.dart';
import 'package:machine_test/view/sign_up.dart';
import 'package:machine_test/widgets/custom_textfield.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();

  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            child: Column(
              children: [
                sizedboxh30,
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                  ),
                ),
                sizedboxh30,
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                sizedboxh10,
                const Text(
                  'please login to continue using our app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sizedboxh30,
                customTextFileld(hintText: 'Email', controller: emailController),
                sizedboxh30,
                customTextFileld(hintText: 'Password', icon: Icons.remove_red_eye, controller: passController),
                sizedboxh10,
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                sizedboxh30,
                ElevatedButton(
                  onPressed: () {
                    ApiCall().apiSignIn(password: passController.text.trim(), username: emailController.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: Size(size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                // const Text(
                //     "Dont't have account? Sign Up",
                //     style: TextStyle(color: Colors.grey, fontSize: 15),
                //   )
                sizedboxh30,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Dont't have account?",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        TextSpan(
                          text: ' Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
