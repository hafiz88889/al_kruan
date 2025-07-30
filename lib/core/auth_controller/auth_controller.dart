import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/utils/route.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseFirestore.instance.collection("user").doc(userCredential.user!.uid).set({
        "email":email,
        "password":password,
        "createTime":FieldValue.serverTimestamp()
      });
      Get.snackbar("Success", "Account created successfully");
      Get.toNamed(RouteHelper.homePage);
    }
    catch(e){
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> loginUser (String email,String password)async{
    try{
      UserCredential userCredential =await auth.signInWithEmailAndPassword(email: email, password: password);
      String uid=userCredential.user!.uid;
      DocumentSnapshot userDoc=await FirebaseFirestore.instance
      .collection("user")
      .doc(uid)
      .get();
      if(userDoc.exists){
        Get.toNamed(RouteHelper.homePage);
      }else{
        Get.snackbar("Login Error", "You are not allowed for login ");
      }
    }
    catch(e){
      Get.snackbar("Login Error", e.toString());
    }
  }

}