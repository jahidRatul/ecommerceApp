import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/view_model/category_list_view_model.dart';
import 'package:ecommerce_app/core/view_model/category_product_list_view_model.dart';
import 'package:ecommerce_app/screen/category_product_list_page/category_product_list_page.dart';
import 'package:ecommerce_app/screen/product_details/product_details_page.dart';
import 'package:ecommerce_app/screen/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  CategoryProductListViewModel categoryProductListViewModelBindInit =
      Get.put(CategoryProductListViewModel());

  CategoryListViewModel categoryListViewModelBindInit =
      Get.put(CategoryListViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryListViewModelBindInit.getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<CategoryListViewModel>(
            builder: (categoryController) => Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 0),
                    itemCount:
                        categoryController.categoryListModel.category?.length ??
                            0,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () async {
                          await categoryProductListViewModelBindInit
                              .getCategoryProductList(
                                  categoryProductsUrl: categoryController
                                          .categoryListModel
                                          .category![index]
                                          .url ??
                                      '');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryProductListPage()));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://picsum.photos/300',
                                    )),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Colors.redAccent,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                categoryController.categoryListModel
                                        .category![index].name ??
                                    '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 3 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: 6,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://picsum.photos/250',
                              )),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.redAccent,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Featured ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailsPage()),
                  ),
                },
                child: Card(
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: 190,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://picsum.photos/350',
                          fit: BoxFit.cover,
                          height: 180,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Text(
                            ' vision refrigator 1efrigator 150lvision refrigator 150l',
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "10000\$",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "10000\$",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RatingBarIndicator(
                          rating: 2.5,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 16.0,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                  autoPlay: true,
                  height: 300,
                  enlargeCenterPage: false,
                  viewportFraction: .5,
                  autoPlayCurve: Curves.easeIn
                  // initialPage: 2,
                  ),
            ),
          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://picsum.photos/400',
                      )),
                  color: Colors.redAccent,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Top Rated ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://picsum.photos/450',
                        fit: BoxFit.cover,
                        height: 180,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Text(
                          ' vision refrigator 1efrigator 150lvision refrigator 150l',
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "10000\$",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "10000\$",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RatingBarIndicator(
                        rating: 2.5,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 16.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              options: CarouselOptions(
                  autoPlay: true,
                  height: 300,
                  enlargeCenterPage: false,
                  viewportFraction: .5,
                  autoPlayCurve: Curves.easeIn
                  // initialPage: 2,
                  ),
            ),
          ),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://picsum.photos/500',
                      )),
                  color: Colors.redAccent,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Best Seller ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://picsum.photos/550',
                        fit: BoxFit.cover,
                        height: 180,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Text(
                          ' vision refrigator 1efrigator 150lvision refrigator 150l',
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "10000\$",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "10000\$",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RatingBarIndicator(
                        rating: 2.5,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 16.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              options: CarouselOptions(
                  autoPlay: true,
                  height: 300,
                  enlargeCenterPage: false,
                  viewportFraction: .5,
                  autoPlayCurve: Curves.easeIn

                  // initialPage: 2,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
