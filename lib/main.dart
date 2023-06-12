import 'package:firebase/commerce/view/add_data.dart';
import 'package:firebase/commerce/view/show_data.dart';
import 'package:firebase/login/Homescreen.dart';
import 'package:firebase/login/selectscreen.dart';
import 'package:firebase/login/login.dart';
import 'package:firebase/login/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
              name: '/',
              page: () => HomeScreen(),
            ),
            GetPage(
              name: '/select',
              page: () => SelectScreen(),
            ),
            GetPage(
              name: '/login',
              page: () => LoginScreen(),
            ),
            GetPage(
              name: '/signUp',
              page: () => SignUpScreen(),
            ),
            GetPage(
              name: '/add',
              page: () => Add_product(),
            ),
            GetPage(
              name: '/data',
              page: () => Home_Screen(),
            ),
          ],
        );
      },
    ),
  );
}
