import 'package:dummy_project/ui/home_screen/presentation/home_screen.dart';
import 'package:dummy_project/ui/login_screen/presentation/provider/login_page_notifier_provider.dart';
import 'package:dummy_project/ui/login_screen/presentation/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late BuildContext _dialogContext;

  @override
  Widget build(BuildContext context) {
    _dialogContext=context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F6F6),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Image.asset('assets/app_icon.png'),
            const SizedBox(height: 50),
            const Text(
              "Login With Your Email & Password",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            LoginTextField(
              prefixImageName: 'assets/email_icon.png',
              title: "Email",
              hintText: "Enter Your Email",
              controller: emailController,
            ),
            const SizedBox(height: 10),
            LoginTextField(
              prefixImageName: 'assets/lock_icon.png',
              title: "Password",
              hintText: "Enter Your Password",
              isSuffixIcon: true,
              controller: passwordController,
              isObscureText: true,
            ),
            Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {}, child: const Text('Forgot Password?'))),
            const Spacer(),
            Consumer(builder: (context, ref, _) {
              ref.listen(loginPageNotifierProvider, (previous, next) {
                next.maybeWhen(
                  success: (data) {
                    _dismissLoadingPopup();
                    if (data.status ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(data.message ?? "")),
                      );
                    }
                  },
                  failure: (error) {
                    _dismissLoadingPopup();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error)),
                    );
                  },
                  loading: () {
                    _showLoadingPopup(context);
                  },
                  orElse: () {
                    _dismissLoadingPopup();
                  },
                );
              });
              return GestureDetector(
                onTap: () {
                  print(emailController.text);
                  print(passwordController.text);
                  ref.read(loginPageNotifierProvider.notifier).getLoginResData(
                      emailController.text, passwordController.text);
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: const Color(0xff4A101D),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have and account?",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showLoadingPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        _dialogContext = dialogContext;
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircleAvatar(

              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }

  void _dismissLoadingPopup() {
    if (_dialogContext != null) {
      Navigator.of(_dialogContext).pop(); // Dismiss the dialog
    }
  }
}
