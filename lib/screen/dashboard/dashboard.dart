import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommerce_app/screen/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/screen/homePage/homepage.dart';
import 'package:ecommerce_app/screen/wishlist/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> selectedHomeWidget = <Widget>[
    WishlistScreen(),
    Homepage(),
    CartPage(),
    Container()
  ];
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.favorite_border, title: 'Favorite'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add_shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 2, //optional, default as 0
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Container(
          width: double.infinity,
          color: Colors.white,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for something',
                prefixIcon: Icon(Icons.search),
                // suffixIcon: Icon(Icons.camera_alt),
              ),
            ),
          ),
        ),
        // actions: [
        //   Icon(Icons.add_shopping_cart),
        //   SizedBox(
        //     width: 10,
        //   ),
        //   Icon(Icons.favorite_border),
        //   SizedBox(
        //     width: 10,
        //   ),
        //   Icon(Icons.compare_arrows),
        //   SizedBox(
        //     width: 10,
        //   ),
        // ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.network(
                'https://picsum.photos/500',
                fit: BoxFit.cover,
              ),
            ),
            ExpansionTile(
              title: Text("Expansion Title"),
              children: <Widget>[Text("children 1"), Text("children 2")],
            )
          ],
        ),
      ),
      body: Center(
        child: selectedHomeWidget.elementAt(_selectedIndex),
      ),
    );
  }
}
