// import 'package:firebase/fire_helper/fb_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Positioned(
//                     left: 30,
//                     width: 80,
//                     height: 200,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 140,
//                     width: 80,
//                     height: 150,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 40,
//                     top: 40,
//                     width: 80,
//                     height: 150,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       child: Container(
//                     margin: const EdgeInsets.only(top: 50),
//                     child: const Center(
//                       child: Text(
//                         "SignUp",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   )),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           const BoxShadow(
//                             color: Colors.black54,
//                             blurRadius: 20.0,
//                             offset: Offset(0, 10),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(8.0),
//                             decoration: const BoxDecoration(
//                               border: Border(
//                                 bottom: BorderSide(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                             child: TextField(
//                               controller: txtemail,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Email or Phone number",
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey[400],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextField(
//
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Password",
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey[400],
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     InkWell(
//                       onTap: () async {
//
//                       },
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.black,
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "SignUp",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         var msg = await FirebaseHelper.firebaseHelper
//                             .signInWithGoogle();
//
//                         Get.snackbar("$msg", "Guser added ");
//                         if (msg == "Success") {
//                           Get.offAndToNamed('/home');
//                         }
//                       },
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.black,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 child: Image.asset(
//                                   "assets/images/google.png",
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             const Center(
//                               child: Text(
//                                 "Sign In With Google",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 70,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       child: const Text(
//                         "Already Have An Account? Sign In",
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase/utils/fb_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  bool Re1 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/images/log.png",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/Vector.png",
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Create Account",
                        style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                ),
                                child: TextField(
                                  controller: txtemail,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                ),
                                child: TextField(
                                  controller: txtpassword,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: Re1,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        Re1 = value!;
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  "I agree terms and conditions",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    bool? msg = await FireBaseHelper
                                        .fireBaseHelper
                                        .Create(
                                      email: txtemail.text,
                                      password: txtpassword.text,
                                    );
                                    print(msg);
                                    if (msg == true) {
                                      print("Done");
                                      Get.snackbar(
                                          "Account Created", "Fire Base",
                                          colorText: Colors.white);
                                      Get.toNamed('/login');
                                    } else if (msg == false) {
                                      print("Cancle");
                                      Get.snackbar("Try with Another User Name",
                                          "Fire Base",
                                          colorText: Colors.white);
                                    }
                                  },
                                  child: Center(
                                    child: Image.asset(
                                      "assets/images/Rec.png",
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(17),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have Account ? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed('/login');
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
