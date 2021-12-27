import 'package:ecommerce_app/core/view_model/category_product_list_view_model.dart';
import 'package:ecommerce_app/screen/product_details/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CategoryProductListPage extends StatefulWidget {
  @override
  _CategoryProductListPageState createState() =>
      _CategoryProductListPageState();
}

class _CategoryProductListPageState extends State<CategoryProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: GetBuilder<CategoryProductListViewModel>(
          builder: (catProductController) => Container(
            // height: MediaQuery.of(context).size.height,

            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: catProductController
                            ?.categoryProductListModel?.products?.length ??
                        0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        childAspectRatio: 3 / 5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(
                                        selectedProduct: catProductController
                                            ?.categoryProductListModel
                                            ?.products![index],
                                      )));
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            // width: 190,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.favorite),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Center(
                                    child: Image.network(
                                      'https://picsum.photos/600',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  catProductController?.categoryProductListModel
                                          ?.products![index]?.name ??
                                      '',
                                  overflow: TextOverflow.fade,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${catProductController?.categoryProductListModel?.products![index]?.price ?? 0}\৳",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "${catProductController?.categoryProductListModel?.products![index]?.previousPrice ?? 0}\৳",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough),
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
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
