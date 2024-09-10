import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_shopping/model/User.dart';
import 'package:online_shopping/model/productModel.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;
  static Future<void> Add(String name, String phoneNumber, String age) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .add({'name': name, 'phoneNumber': phoneNumber, 'age': age});
    print("added");
  }

  static Future<void> AddUserInfo(
      String name, String phoneNumber, String age) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .set({'name': name, 'phoneNumber': phoneNumber, 'age': age});
    print("added");
  }

  static Future<List<Product>> getProducts(String productType) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(productType).get();

      List<Product> products = querySnapshot.docs.map((doc) {
        return Product.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      return products;
    } catch (e) {
      print("Error getting documents: $e");
      return [];
    }
  }

  static Future<void> getUserInfo() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        // Extract data and assign to User1 class
        var data = snapshot.data() as Map<String, dynamic>;
        User1.name = data['name'] ?? 'No Name';
        User1.phoneNumber = data['phoneNumber'] ?? 'No Phone';
        User1.age = data['age'] ?? 'No Age';
      } else {
        print("No user data found!");
      }
    } catch (e) {
      print("Error getting document: $e");
    }
  }
}
