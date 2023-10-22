// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopping_ui/models/product.dart';

import '../screens/product_detail_screen.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white24,
      ),
      child: Card(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailScreen(productModel: productModel),
                ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300 / 2, // This childs parent height is 150
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      productModel.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                productModel.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "\$ " + productModel.price.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
