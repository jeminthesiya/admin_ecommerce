// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AddScreenController extends GetxController
// {
//   TextEditingController txtNotes = TextEditingController();
//   TextEditingController txtDate = TextEditingController(text: "${DateTime.now()}");
//   TextEditingController txtTime = TextEditingController(text: "${TimeOfDay.now()}");
//   TextEditingController txtProrority = TextEditingController();
//   TextEditingController txtTitle = TextEditingController();
// }
//
import 'package:firebase/commerce/model/commerce_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Home_Controller extends GetxController {
  RxMap userDetail = {}.obs;

  List<Home_model> DataList = [];

  Home_model updateData = Home_model();

  void getData()
  {
    User? user= FirebaseAuth.instance.currentUser;

    }
}