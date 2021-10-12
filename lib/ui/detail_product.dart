import 'package:api_project/data/db_helper.dart';
import 'package:api_project/providers/my_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Consumer<MyProvider>(
        builder: (context, provider, index) {
          return provider.selectedProduct == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CachedNetworkImage(
                            imageUrl: provider.selectedProduct.image),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '''Title: ${provider.selectedProduct.title}''',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        color = Colors.red;
                                      });
                                      // print(provider.selectedProduct.toJson());
                                      provider.addFavoriteProduct(
                                          provider.selectedProduct);
                                    },
                                    icon: Icon(Icons.favorite,
                                        color: provider.favoriteProduct.any(
                                                (element) =>
                                                    element.id ==
                                                    provider.selectedProduct.id)
                                            ? Colors.red
                                            : Colors.black
                                        // color: color,
                                        ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Description: ' +
                                    provider.selectedProduct.description,
                                style: TextStyle(fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Price: ' +
                                    provider.selectedProduct.price.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print(provider.selectedProduct);
                          provider.addcartProduct(provider.selectedProduct);
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent),
                            width: double.infinity,
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            )),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
