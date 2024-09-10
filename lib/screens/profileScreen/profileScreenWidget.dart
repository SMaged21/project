import 'package:flutter/material.dart';
import 'package:online_shopping/screens/profileEditScreen/profileEditScreen.dart';
import 'package:online_shopping/theme/colors.dart';

Widget header(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 60,
            color: secondaryColor,
          )),
      IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Profileeditscreen()));
          },
          icon: Icon(
            Icons.edit,
            size: 50,
            color: secondaryColor,
          )),
    ],
  );
}

Widget Body(name, phone) {
  return Container(
    child: Builder(builder: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    "images/44+ Ideas Flowers Wedding Bouquet Cascade White Roses.jpeg"),
                radius: 60,
              ),
            ],
          ),
          Center(
            child: Text(
              name, // Use dynamic user data
              style: TextStyle(
                  color: fourthColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              phone,
              style: TextStyle(color: fourthColor, fontSize: 20),
            ),
          ),
        ],
      );
    }),
  );
}

Widget tail(BuildContext context, age) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 180,
    color: secondaryColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              age, // Use dynamic age data
              style: TextStyle(
                  color: primeColor, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Age",
              style: TextStyle(color: primeColor, fontSize: 30),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "5", // Static value for orders, replace with dynamic if needed
              style: TextStyle(
                  color: primeColor, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Orders",
              style: TextStyle(color: primeColor, fontSize: 30),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1800\$", // Static value for total price
              style: TextStyle(
                  color: primeColor, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Total Price",
              style: TextStyle(color: primeColor, fontSize: 30),
            ),
          ],
        )
      ],
    ),
  );
}
