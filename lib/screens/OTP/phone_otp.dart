import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:collabapp/screens/OTP/function.dart';
import 'package:collabapp/screens/OTP/verification_otp.dart';
import 'package:collabapp/resources/color_manager.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  bool loading = false;
  String phoneNumber = '';
  void sendOtpCode() {
    loading = true;
    setState(() {});
    final _auth = FirebaseAuth.instance;
    if (phoneNumber.isNotEmpty) {
      authWithPhoneNumber(phoneNumber, onCodeSend: (verificationId, v) {
        loading = false;
        setState(() {});
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => VerificationOtp(
                  verificationId: verificationId,
                  phoneNumber: phoneNumber,
                )));
      }, onAutoVerify: (v) async {
        await _auth.signInWithCredential(v);
        Navigator.of(context).pop();
      }, onFailed: (e) {
        loading = false;
        setState(() {});
        print("Le code est erroné");
      }, autoRetrieval: (v) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/otp.png',
                  width: 300,
                  height: 300,
                ),
                const Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                IntlPhoneField(
                  initialCountryCode: "TN",
                  onChanged: (value) {
                    phoneNumber = value.completeNumber;
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15)),
                      onPressed: loading ? null : sendOtpCode,
                      child: loading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : const Text(
                              'Send the code',
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
