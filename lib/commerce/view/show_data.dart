import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/commerce/controller/commerce_controller.dart';
import 'package:firebase/commerce/model/commerce_model.dart';
import 'package:firebase/utils/fb_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  bool isLogin = false;
  Home_Controller contoller = Get.put(Home_Controller());

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                placeholder: 'Search',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 182,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    "assets/images/spac.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Text(
                "New Arrivals",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FireBaseHelper.fireBaseHelper.GetData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    contoller.DataList.clear();
                    QuerySnapshot? snapData = snapshot.data;

                    for (var x in snapData!.docs) {
                      Map data = x.data() as Map;
                      String? name = data['p_name'];
                      String? notes = data['p_notes'];
                      String? date = data['p_date'];
                      String? time = data['p_time'];
                      String? price = data['p_price'];
                      String? image = data['p_image'];

                      Home_model home_model = Home_model(
                        p_name: name,
                        p_notes: notes,
                        p_date: date,
                        p_price: price,
                        p_image: image,
                        p_time: time,
                        key: x.id,
                      );
                      contoller.DataList.add(home_model);
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 150,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Home_model home_model = Home_model(
                                key: contoller.DataList[index].key,
                                p_time: contoller.DataList[index].p_time,
                                p_price: contoller.DataList[index].p_price,
                                p_date: contoller.DataList[index].p_date,
                                p_notes: contoller.DataList[index].p_notes,
                                p_name: contoller.DataList[index].p_name,
                                checkupdate: 1,
                              );
                              Get.toNamed("/add", arguments: home_model);
                            },
                            onLongPress: () {
                              var key = contoller.DataList[index].key;
                              FireBaseHelper.fireBaseHelper.deletedata(key!);
                              Get.snackbar("Delete", "success");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 120,
                                      color: Colors.red,
                                      child: Image.network(
                                        "${contoller.DataList[index].p_image}",
                                        fit: BoxFit.cover,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${contoller.DataList[index].p_name}",
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "₹${contoller.DataList[index].p_price}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      // Text(
                                      //   "${contoller.DataList[index].p_notes}",
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   "${contoller.DataList[index].p_date}",
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   "${contoller.DataList[index].p_time}",
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/images/Group.png",
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/images/like.png",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: contoller.DataList.length,
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          onPressed: () {
            Home_model home_model = Home_model(
              checkupdate: 0,
            );
            Get.toNamed("/add", arguments: home_model);
          },
        ),
      ),
    );
  }
}
