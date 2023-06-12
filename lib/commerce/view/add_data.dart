// import 'package:firebase/commerce/controller/commerce_controller.dart';
// import 'package:firebase/utils/fb_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AddScreen extends StatefulWidget {
//   const AddScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddScreen> createState() => _AddScreenState();
// }
//
// class _AddScreenState extends State<AddScreen> {
//   Map data = Get.arguments;
//   AddScreenController getx = Get.put(AddScreenController());
//
//   @override
//   void initState() {
//     super.initState();
//     if (data['check'] == 0) {
//       getx.txtTime = TextEditingController(
//         text: "${data['time']}",
//       );
//       getx.txtDate = TextEditingController(text: "${data['date']}");
//       getx.txtNotes = TextEditingController(text: "${data['notes']}");
//       getx.txtProrority = TextEditingController(text: "${data['priority']}");
//       getx.txtTitle = TextEditingController(text: "${data['title']}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: Text("Add Data"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: getx.txtTitle,
//                   decoration: InputDecoration(
//                     hintText: "Title",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2,
//                 ),
//                 TextField(
//                   controller: getx.txtDate,
//                   decoration: InputDecoration(
//                     hintText: "Date",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2,
//                 ),
//                 TextField(
//                   controller: getx.txtTime,
//                   decoration: InputDecoration(
//                     hintText: "Time",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // SizedBox(height: 2.h,),
//                 TextField(
//                   controller: getx.txtProrority,
//                   decoration: InputDecoration(
//                     hintText: "Proirity",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2,
//                 ),
//                 TextField(
//                   controller: getx.txtNotes,
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     hintText: "Note",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: 2,
//                 ),
//                 data['check'] == 1
//                     ? ElevatedButton(
//                         onPressed: () {
//                           if (getx.txtTime.text != null &&
//                               getx.txtProrority.text != null &&
//                               getx.txtNotes.text != null &&
//                               getx.txtTitle.text != null &&
//                               getx.txtDate.text != null) {
//                             FireBaseHelper.fireBaseHelper.addData(
//                               date: getx.txtDate.text,
//                               title: getx.txtTitle.text,
//                               notes: getx.txtNotes.text,
//                               priority: getx.txtProrority.text,
//                               time: getx.txtTime.text,
//                             );
//                             Get.toNamed("/data");
//                           } else {
//                             Get.snackbar("update", "Enter Required Data");
//                           }
//                         },
//                         child: Text(
//                           "Enter Data",
//                         ),
//                       )
//                     : ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.black),
//                         onPressed: () {
//                           FireBaseHelper.fireBaseHelper.updateData(
//                             key: data['id'],
//                             date: getx.txtDate.text,
//                             title: getx.txtTitle.text,
//                             priority: getx.txtProrority.text,
//                             time: getx.txtTime.text,
//                             notes: getx.txtNotes.text,
//                           );
//                           Get.back();
//                         },
//                         child: Text(
//                           "Update Data",
//                         ),
//                       ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase/commerce/controller/commerce_controller.dart';
import 'package:firebase/commerce/model/commerce_model.dart';
import 'package:firebase/utils/fb_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_product extends StatefulWidget {
  const Add_product({Key? key}) : super(key: key);

  @override
  State<Add_product> createState() => _Add_productState();
}

class _Add_productState extends State<Add_product> {
  Home_Controller contoller = Get.put(Home_Controller());
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnotes = TextEditingController();
  TextEditingController txtimage = TextEditingController();
  TextEditingController txtdate = TextEditingController(
      text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
  TextEditingController txttime = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController txtprice = TextEditingController();
  Home_model home_model = Get.arguments;

  @override
  void initState() {
    super.initState();

    home_model.checkupdate == 1 ? NewData() : OldData();
  }

  void NewData() {
    txtname = TextEditingController(text: "${home_model.p_name}");
    txtprice = TextEditingController(text: "${home_model.p_price}");
    txttime = TextEditingController(text: "${home_model.p_time}");
    txtimage = TextEditingController(text: "${home_model.p_image}");
    txtdate = TextEditingController(text: "${home_model.p_date}");
    txtnotes = TextEditingController(text: "${home_model.p_notes}");
  }

  void OldData() {
    txtname = TextEditingController();
    txtimage = TextEditingController();
    txtnotes = TextEditingController();
    txtdate = TextEditingController(
        text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
    txttime = TextEditingController(
        text:
            "${DateTime.now().day}/ ${DateTime.now().month}/ ${DateTime.now().year}");
    txtprice = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text(
            "Add Data",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/log.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: txtname,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Product Name",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: txtprice,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Product Price",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: txttime,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Time",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: txtdate,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Date",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: txtnotes,
                          maxLines: 3,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Notes",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: txtimage,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Image URL",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      home_model.checkupdate == 0
                          ? FireBaseHelper.fireBaseHelper.AddData(
                              p_price: txtprice.text,
                              p_name: txtname.text,
                              p_date: txtdate.text,
                              p_notes: txtnotes.text,
                              p_time: txttime.text,
                            )
                          : FireBaseHelper.fireBaseHelper.UpadteData(
                              p_name: txtname.text,
                              p_notes: txtnotes.text,
                              p_date: txtdate.text,
                              p_time: txttime.text,
                              p_price: txtprice.text,
                              key: home_model.key,
                              p_image: txtimage.text,
                            );
                      Get.back();
                    },
                    child: home_model.checkupdate == 0
                        ? Text("Add Data")
                        : Text("Update Data"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
