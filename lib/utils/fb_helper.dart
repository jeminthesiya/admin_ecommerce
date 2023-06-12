import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseHelper {
  static FireBaseHelper fireBaseHelper = FireBaseHelper._();

  FireBaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool?> Create({required email, required password}) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      return true;
    }).catchError((e) {
      return false;
    });
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<bool?> Check({required email, required password}) async {
    bool? mag;

    return await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        return true;
      },
    ).catchError(
      (e) {
        return false;
      },
    );
    return mag;
  }

  bool StoreLigin() {
    User? user = firebaseAuth.currentUser;
    print("======================= method  $user");
    return user != null;
  }

  sinhInThroughGoogle() async {
    bool? msg;
    GoogleSignInAccount? user = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await user?.authentication;

    var crd = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await firebaseAuth
        .signInWithCredential(crd)
        .then((value) => msg = true)
        .catchError((e) => msg = false);
    return msg;
  }

  userData() {
    User? use = firebaseAuth.currentUser;
    String? image = use?.photoURL;
    String? email = use?.email;
    String? name = use?.displayName;
    return {'e1': email, 'name': name, 'img': image};
  }

  // addData({notes, title, date, time, priority}) {
  //   User? user = firebaseAuth.currentUser;
  //   FirebaseFirestore inse = FirebaseFirestore.instance;
  //   inse.collection('Task').doc('${user!.uid}').collection("ProductName").add(
  //     {
  //       "notes": notes,
  //       "title": title,
  //       "date": date,
  //       "time": time,
  //       "priority": priority,
  //     },
  //   );
  // }

  Future<void> AddData({
    p_name,
    p_notes,
    p_date,
    p_time,
    p_price,
    p_image,
  }) async {
    User? user = firebaseAuth.currentUser;
    String uid = user!.uid;
    await firestore
        .collection("ProductName")
        .doc("$uid")
        .collection("ProductName")
        .add({
      "p_name": p_name,
      "p_notes": p_notes,
      "p_date": p_date,
      "p_time": p_time,
      "p_price": p_price,
      "p_image": p_image,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readData() {
    FirebaseFirestore inse = FirebaseFirestore.instance;
    User? user = firebaseAuth.currentUser;
    return inse
        .collection('Task')
        .doc('${user!.uid}')
        .collection('ProductName')
        .snapshots();
  }

  // Future<void> updateData({
  //   required key,
  //   required date,
  //   required time,
  //   required notes,
  //   required priority,
  //   required title,
  // }) {
  //   User? user = firebaseAuth.currentUser;
  //   FirebaseFirestore inse = FirebaseFirestore.instance;
  //   return inse
  //       .collection('Task')
  //       .doc('${user?.uid}')
  //       .collection('ProductName')
  //       .doc(key)
  //       .set({
  //     "date": date,
  //     "notes": notes,
  //     "priority": priority,
  //     "time": time,
  //     "title": title,
  //   });
  // }

  void UpadteData({
    required p_name,
    required p_notes,
    required p_date,
    required p_time,
    required p_price,
    required p_image,
    required key,
  }) {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;
    firestore
        .collection("ProductName")
        .doc("$uid")
        .collection("ProductName")
        .doc(key)
        .set({
      "p_name": p_name,
      "p_notes": p_notes,
      "p_date": p_date,
      "p_time": p_time,
      "p_image": p_image,
      "p_price": p_price,
    });
  }

  bool Checklogin() {
    User? user = firebaseAuth.currentUser;
    var uid = user?.uid;
    if (uid != null) {
      return true;
    } else {
      return false;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> GetData() {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;

    return firestore
        .collection("ProductName")
        .doc("$uid")
        .collection("ProductName")
        .snapshots();
  }

  Future<void> deletedata(String key) async {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;

    await firestore
        .collection("ProductName")
        .doc("$uid")
        .collection("ProductName")
        .doc(key)
        .delete();
  }
}
