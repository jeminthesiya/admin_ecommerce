// import 'package:firebase/fire_helper/fb_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController txtemail = TextEditingController();
//   TextEditingController txtpassword = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(30.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black54,
//                             blurRadius: 20.0,
//                             offset: Offset(0, 10),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(8.0),
//                             decoration: BoxDecoration(
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
//                             padding: EdgeInsets.all(8.0),
//                             child: TextField(
//                               controller: txtpassword,
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
//                     SizedBox(
//                       height: 30,
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         String email = txtemail.text;
//                         String password = txtpassword.text;
//
//                         String msg = await FirebaseHelper.firebaseHelper
//                             .signIn(email: "$email", password: "$password");
//                         Get.snackbar("$msg", "user added!");
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
//                         child: Center(
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 70,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Get.toNamed('/signUp');
//                       },
//                       child: Text(
//                         "Don't Have An Account? Sign Up",
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  bool Re = false;

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                                      value: Re,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            Re = value!;
                                          },
                                        );
                                      },
                                    ),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Forget password ?",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35),
                                  child: InkWell(
                                    onTap: () async {
                                      bool? msg = await FireBaseHelper
                                          .fireBaseHelper
                                          .Check(
                                        email: txtemail.text,
                                        password: txtpassword.text,
                                      );
                                      if (msg == true) {
                                        Get.snackbar(
                                            "login successfully", "Fire Base");
                                        Map args = {
                                          "check": 1,
                                        };
                                        Get.offAndToNamed("/data", arguments: args);
                                      } else {
                                        Get.snackbar(
                                            "Enter Valid Id Or Password",
                                            "Fire Base");
                                      }
                                    },
                                    child: Image.asset(
                                      "assets/images/login.png",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account ? ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.pushNamed(context, 'signup');
                                        Get.toNamed('/signUp');
                                      },
                                      child: Text(
                                        "Sign Up",
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
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      child: InkWell(
                        onTap: () async {
                          var msg = await FireBaseHelper.fireBaseHelper.sinhInThroughGoogle();
                          if (msg == "Success") {
                          }
                        },
                        child: Image.asset(
                          "assets/images/google.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        "assets/images/facebook.png",
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        "assets/images/tweeter.png",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
