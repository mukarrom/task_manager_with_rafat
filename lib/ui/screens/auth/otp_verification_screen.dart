import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_app/ui/screens/auth/login_screen.dart';
import 'package:task_manager_app/ui/screens/auth/reset_password_screen.dart';
import 'package:task_manager_app/ui/widgets/screen_background.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PIN Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "A 6 digits verification pin will send to your email address",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // ------------ pin code field ------------
                  PinCodeTextField(
                    enablePinAutofill: true,
                    cursorColor: Colors.green,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: Colors.green,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.red,
                      disabledColor: Colors.blueGrey,
                      selectedFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    // backgroundColor: Colors.white,
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    onCompleted: (v) {
                      // print("Completed");
                    },
                    onChanged: (value) {
                      // print(value);
                      setState(() {
                        // currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      // print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),

                  ///--------- end pin code field----------
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen(),
                          ),(route)=> false,
                        );
                      },
                      child: const Text('Verify'),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'have an account?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false);
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
    );
  }
}
