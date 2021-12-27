import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommerce_app/core/utils/dialog/confirm_dialog.dart';
import 'package:ecommerce_app/core/view_model/category_list_view_model.dart';
import 'package:ecommerce_app/screen/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/screen/homePage/homepage.dart';
import 'package:ecommerce_app/screen/wishlist/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final firstNavKey = GlobalKey<NavigatorState>();
  final secondNavKey = GlobalKey<NavigatorState>();
  final thirdNavKey = GlobalKey<NavigatorState>();
  final fourthNavKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;
  // List<Widget> selectedHomeWidget = <Widget>[
  //   WishlistScreen(),
  //   Homepage(),
  //   CartPage(),
  //   Container()
  // ];
  // int _selectedIndex = 2;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.favorite_border, title: 'Favorite'),
          TabItem(icon: Icons.add_shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (val) => _onTap(val, context),
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
      ),
      drawer: Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            DrawerHeader(
              child: Image.network(
                'https://picsum.photos/500',
                fit: BoxFit.cover,
              ),
            ),
            GetBuilder<CategoryListViewModel>(
              builder: (categoryController) => ListView.builder(
                  itemCount:
                      categoryController?.categoryListModel?.category?.length ??
                          0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 15),
                      title: Row(
                        children: [
                          Image.network(
                            "https://picsum.photos/30",
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(categoryController?.categoryListModel
                                    ?.category![index]?.name ??
                                ''),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        // Text("children 1"),
                        // Text("children 2"),
                        ListView.builder(
                            itemCount: categoryController?.categoryListModel
                                    ?.category![index]?.subs?.length ??
                                0,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index1) {
                              return ExpansionTile(
                                childrenPadding: EdgeInsets.only(left: 10),
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Text(categoryController
                                              ?.categoryListModel
                                              ?.category![index]
                                              ?.subs![index1]
                                              ?.name ??
                                          ''),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  ListView.builder(
                                      itemCount: categoryController
                                              ?.categoryListModel
                                              ?.category![index]
                                              ?.subs![index1]
                                              ?.childs
                                              ?.length ??
                                          0,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index2) {
                                        return ListTile(
                                          title: Row(
                                            children: [
                                              Expanded(
                                                child: Text(categoryController
                                                        ?.categoryListModel
                                                        ?.category![index]
                                                        ?.subs![index1]
                                                        ?.childs![index2]
                                                        ?.name ??
                                                    ''),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ],
                              );
                            }),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (_selectedIndex == 0 && firstNavKey.currentState!.canPop()) {
            firstNavKey.currentState!.pop();
            print('can pop');
            return false;
          }
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return ConfirmDialog(
                    titleText: 'EXIT !',
                    bodyText: "Are you sure, you want to exit app ?",
                    yesPress: () {
                      SystemNavigator.pop();
                    },
                    noPress: () {
                      Navigator.pop(context);
                    });
              });

          print('cannot pop');
          return true;
        },
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            Navigator(
              key: firstNavKey,
              onGenerateRoute: (route1) => MaterialPageRoute(
                settings: route1,
                builder: (context) => Homepage(),
              ),
            ),
            Navigator(
              key: secondNavKey,
              onGenerateRoute: (route1) => MaterialPageRoute(
                settings: route1,
                builder: (context) => WishlistScreen(),
              ),
            ),
            Navigator(
              key: thirdNavKey,
              onGenerateRoute: (route1) => MaterialPageRoute(
                settings: route1,
                builder: (context) => CartPage(),
              ),
            ),
            Navigator(
              key: fourthNavKey,
              onGenerateRoute: (route1) => MaterialPageRoute(
                settings: route1,
                builder: (context) => Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int val, BuildContext context) {
    if (_selectedIndex == val) {
      switch (val) {
        case 0:
          firstNavKey.currentState!.popUntil((route1) => route1.isFirst);
          break;
        // case 0:
        //   firstNavKey.currentState!.popUntil((route1) => route1.isFirst);
        //   break;
        // case 0:
        //   firstNavKey.currentState!.popUntil((route1) => route1.isFirst);
        //   break;
        // case 0:
        //   firstNavKey.currentState!.popUntil((route1) => route1.isFirst);
        //   break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _selectedIndex = val;
        });
      }
    }
  }
}
