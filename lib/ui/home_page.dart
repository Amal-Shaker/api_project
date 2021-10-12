import 'package:api_project/data/api_helper.dart';
import 'package:api_project/data/db_helper.dart';
import 'package:api_project/models/productresponse.dart';
import 'package:api_project/providers/my_provider.dart';
import 'package:api_project/ui/detail_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  Color color = Colors.blueAccent;
  String product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('product'),
        ),
        body: Consumer<MyProvider>(builder: (context, provider, x) {
          return Column(
            children: [
              provider.allProduct == null
                  ? Container(
                      color: Colors.white,
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      height: 200,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CarouselSlider(
                          items: provider.allProduct
                              .map((e) => CachedNetworkImage(imageUrl: e.image))
                              .toList(),
                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                          ))),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text(
                  'All Categories',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  textAlign: TextAlign.end,
                ),
              ),
              Container(
                height: 70,
                child: provider.allCategories == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: provider.allCategories
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      provider.getCategoryProducts(e);
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      decoration: BoxDecoration(
                                          color: provider.selectedCategory == e
                                              ? Colors.orangeAccent
                                              : Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                          e[0].toUpperCase() + e.substring(1),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
              ),
              Expanded(
                  // margin: EdgeInsets.all(10),
                  child: provider.categoryProducts == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          margin: EdgeInsets.all(10),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: provider.categoryProducts.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    provider.getSingleProduct(
                                        provider.categoryProducts[index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return ProductDetails();
                                    }));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: CachedNetworkImage(
                                            imageUrl: provider
                                                .categoryProducts[index].image,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(provider
                                                .categoryProducts[index].title),
                                            Text('Price: ' +
                                                provider.categoryProducts[index]
                                                    .price
                                                    .toString() +
                                                '\$'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ))
            ],
          );
        }));
  }
}

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Favorite'),
        ),
        body: Consumer<MyProvider>(builder: (context, provider, index) {
          List<ProductResponse> products = provider.favoriteProduct;

          return products == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: products
                      .map((e) => SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(e.image),
                                  ),
                                  Text("${e.price}\$"),
                                  IconButton(
                                      onPressed: () {
                                        provider.deleteFromFavorite(e.id);
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                            ),
                          ))
                      .toList());
        }));
  }
}

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
        ),
        body: Consumer<MyProvider>(builder: (context, provider, index) {
          List<ProductResponse> products = provider.cartProduct;
          return products == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: products
                          .map((e) => SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(e.image),
                                      ),
                                      Text("${e.price}\$"),
                                      IconButton(
                                          onPressed: () {
                                            provider.deleteFromCart(e.id);
                                          },
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                              ))
                          .toList()),
                );
        }));
  }
}
