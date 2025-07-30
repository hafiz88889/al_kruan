import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/auth_controller/auth_controller.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/route.dart';
import 'package:namaz_salat/core/utils/text_style.dart'; // GetX ব্যবহারের জন্য

class RegistrationPage extends StatelessWidget {
  // টেক্সট ফিল্ডের জন্য কন্ট্রোলার
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final AuthController controller=Get.put(AuthController());

  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('রেজিস্ট্রেশন',style: regularTextStyle24.copyWith(color: MyColor.whiteColor),),
        backgroundColor: MyColor.greenColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'নতুন অ্যাকাউন্ট তৈরি করুন',
              style: regularTextStyle24.copyWith(color: MyColor.greenColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'নাম',
                hintText: 'আপনার পুরো নাম লিখুন',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

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
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'পাসওয়ার্ড',
                hintText: 'একটি শক্তিশালী পাসওয়ার্ড লিখুন',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // পাসওয়ার্ড নিশ্চিতকরণ ফিল্ড
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'পাসওয়ার্ড নিশ্চিত করুন',
                hintText: 'পাসওয়ার্ড আবার লিখুন',
                prefixIcon: const Icon(Icons.lock_reset),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // রেজিস্ট্রেশন বাটন
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
             String email=emailController.text.trim();
             String password=passwordController.text.trim();
             if(email.isNotEmpty && password.length>=6){
               controller.registerUser(email, password);
             }else{
               Get.snackbar("Invalid User", "Try again");
             }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor:MyColor.greenColor,
                  foregroundColor: MyColor.whiteColor
                ),
                child: const Text(
                  'রেজিস্টার করুন',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // লগইন পেজে যাওয়ার বাটন
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ইতিমধ্যে একটি অ্যাকাউন্ট আছে?',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    // লগইন পেজে নেভিগেট করুন
                    Get.toNamed(RouteHelper.loginPage); // GetX রাউটিং ব্যবহার করে
                  },
                  child: const Text(
                    'লগইন করুন',
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