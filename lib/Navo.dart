import 'package:flutter/material.dart';
import 'package:homework/item_info.dart';
import 'package:homework/login.dart';
import 'favourite.dart';
import 'homepage.dart';
import 'orders.dart';

class Navo extends StatefulWidget {
  final data;
  Navo({this.data});
  State<Navo> createState() => _Navo1();
}
int counter=1;

class _Navo1 extends State<Navo> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (val) {
        setState(() {
          index = val;
          if (val == 2) {
            //navigateToOrderDetails();
            Navigator.of(context).push(MaterialPageRoute
              (builder:(context)=>order(1)));
          }
          if (val == 0) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => homepage()));
          }

          if (val == 1) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => favourite()));
          }
        });
      },
      selectedItemColor: Colors.pink[900],
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.pink[600],
      currentIndex: index,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: '*'),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: '*'),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), label: '*',),
      ],
    );
  }
}


