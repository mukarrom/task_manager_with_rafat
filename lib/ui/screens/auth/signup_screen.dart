import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';
import 'package:task_manager_app/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = false;

  // form validation
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signupInProgress = false;

  Future<void> userSignup() async {
    _signupInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.registration, <String, dynamic>{
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": "",
    });

    _signupInProgress = false;
    if (mounted) {
      setState(() {});
    }

    log(response.statusCode.toString());
    log(response.body.toString());

    if (response.isSuccess) {
      _emailTEController.clear();
      _firstNameTEController.clear();
      _lastNameTEController.clear();
      _mobileTEController.clear();
      _passwordTEController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration Success'),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration Failed'),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height: size.height,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ----------- title --------------
                    Text(
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // --------- email text field ----------
                    Material(
                      elevation: 1,
                      child: TextFormField(
                        controller: _emailTEController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: 'Email'),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // --------- First name text field ----------
                    Material(
                      elevation: 1,
                      child: TextFormField(
                        controller: _firstNameTEController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your first name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(hintText: 'First Name'),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // --------- Last Name text field ----------
                    Material(
                      elevation: 1,
                      child: TextFormField(
                        controller: _lastNameTEController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your last name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(hintText: 'Last Name'),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // --------- Mobile text field ----------
                    Material(
                      elevation: 1,
                      child: TextFormField(
                        controller: _mobileTEController,
                        validator: (String? value) {
                          if ((value?.isEmpty ?? true) ||
                              (value!.length != 11)) {
                            return 'Enter valid mobile number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: 'Mobile'),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // -------- password field ----------
                    Material(
                      elevation: 1,
                      child: TextFormField(
                        controller: _passwordTEController,
                        validator: (String? value) {
                          if ((value?.isEmpty ?? true) || value!.length < 6) {
                            return 'Password should be at least 6 characters';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              _passwordVisible = !_passwordVisible;
                              setState(() {});
                            },
                            icon: !_passwordVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                        textInputAction: TextInputAction.go,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: !_signupInProgress,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            userSignup();
                          },
                          child: const Icon(Icons.arrow_circle_right_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Have an account?',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
