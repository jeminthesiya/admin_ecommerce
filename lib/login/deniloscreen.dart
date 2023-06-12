// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class StartScreen extends StatefulWidget {
//   const StartScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StartScreen> createState() => _StartScreenState();
// }
//
// class _StartScreenState extends State<StartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: Image.asset(
//                 "assets/images/danilo.png",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 bottom: 170,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     "        change your",
//                     style: GoogleFonts.aBeeZee(
//                       fontSize: 25,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "     style with",
//                     style: GoogleFonts.aBeeZee(
//                       fontSize: 25,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "     our shoes",
//                     style: GoogleFonts.aBeeZee(
//                       fontSize: 25,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(50),
//                         child: Stack(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Get.toNamed('/add');
//                               },
//                               child: Center(
//                                 child: Image.asset(
//                                   "assets/images/Rec.png",
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(17),
//                                 child: Text(
//                                   "Let's started",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
