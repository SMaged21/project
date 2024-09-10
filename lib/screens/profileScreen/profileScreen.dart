import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping/firebase/firestore.dart';
import 'package:online_shopping/model/User.dart';
import 'package:online_shopping/screens/profileScreen/profileScreenWidget.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  void initState() {
    super.initState();
    _getUserInfo();
    print("=================");
  }

  Future<void> _getUserInfo() async {
    await FireStore.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          header(context),
          Body(User1.name, User1.phoneNumber),
          SizedBox(height: 20),
          tail(context, User1.age),
        ],
      ),
    )));
  }
}
