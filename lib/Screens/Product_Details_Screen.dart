import 'package:day25_task/Model/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Products product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.product.title ?? "Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.5),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * .40,
                width: MediaQuery.of(context).size.width * .96,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage("${widget.product.thumbnail}"),
                        fit: BoxFit.contain)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${widget.product.title}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Brand:${widget.product.brand}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rating ${widget.product.rating}⭐",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .24,
                ),
                Text(
                  "Discount ${widget.product.discountPercentage}%",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.red.shade900),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Price: \$${widget.product.price}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .35,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "In Stock ${widget.product.stock}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                )
              ],
            ),
            Divider(
              thickness: 3,
            ),
            Text(
              "About Product",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .25,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${widget.product.description}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
