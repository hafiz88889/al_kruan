import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/auth_controller/auth_controller.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/route.dart';
import 'package:namaz_salat/core/utils/text_style.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController controller= Get.put(AuthController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('লগইন',style: regularTextStyle24.copyWith(color: MyColor.whiteColor),),
        backgroundColor:MyColor.greenColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // কন্টেন্ট মাঝখানে আনতে
          children: [
             Text(
              'আপনার অ্যাকাউন্টে লগইন করুন',
              style:regularTextStyle24.copyWith(color: MyColor.greenColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // ইমেইল ইনপুট ফিল্ড
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'ইমেইল',
                hintText: 'আপনার ইমেইল লিখুন',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // পাসওয়ার্ড ইনপুট ফিল্ড
            TextField(
              controller: passwordController,
              obscureText: true, // পাসওয়ার্ড লুকানোর জন্য
              decoration: InputDecoration(
                labelText: 'পাসওয়ার্ড',
                hintText: 'আপনার পাসওয়ার্ড লিখুন',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // লগইন বাটন
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String email=emailController.text.trim();
                  String password=passwordController.text.trim();
                  if(email.isNotEmpty && password.isNotEmpty){
                    controller.loginUser(email, password);
                  }else{
                    Get.snackbar("Invalid User", "Try again");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: MyColor.greenColor,
                  foregroundColor: MyColor.whiteColor,
                ),
                child: const Text(
                  'লগইন করুন',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // রেজিস্ট্রেশন পেজে যাওয়ার বাটন
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'অ্যাকাউন্ট নেই?',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    // রেজিস্ট্রেশন পেজে নেভিগেট করুন
                    Get.toNamed(RouteHelper.registrationPage); // GetX রাউটিং ব্যবহার করে
                  },
                  child: const Text(
                    'রেজিস্ট্রেশন করুন',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}