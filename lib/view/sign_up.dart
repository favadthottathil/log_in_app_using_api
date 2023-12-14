import 'package:flutter/material.dart';
import 'package:machine_test/Auth/sign_up.dart';
import 'package:machine_test/utils/sized_box.dart';
import 'package:machine_test/view/log_in.dart';
import 'package:machine_test/widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final name = TextEditingController();

    final email = TextEditingController();

    final password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              sizedboxh30,
              const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.lock),
                ),
              ),
              sizedboxh30,
              const Text(
                'Sign Up Now',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              sizedboxh10,
              const Text(
                'Please Fill the Details and create account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedboxh30,
              customTextFileld(hintText: 'Full Name', controller: name),
              sizedboxh30,
              customTextFileld(hintText: 'Email', controller: email),
              sizedboxh30,
              customTextFileld(hintText: 'Password', icon: Icons.remove_red_eye, controller: password),
              sizedboxh10,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password must be alleast 6 Character',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              sizedboxh10,
              sizedboxh30,
              ElevatedButton(
                onPressed: () async {
                  await ApiCall().apiSignUp(
                    email: email.text.trim(),
                    username: name.text.trim(),
                    password: password.text.trim(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size(size.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              sizedboxh30,
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogIn(),
                  ),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have account?",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Login',
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
      )),
    );
  }
}
