import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/data/data.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/utils/utils.dart';

const kPrimaryColor = Colors.red;

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: product.color,
      child: Stack(
        children: [
          // image of product
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 2.05 * pi,
              child: Image.asset(
                product.image,
                height: 80,
              ),
            ),
          ),

          // heart icon
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // 阴影偏移量，向下偏移3个像素
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite,
                color:
                product.isSelected == true ? kPrimaryColor : Colors.black38,
                size: 15,
              ),
            ),
          ),

          // product details
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  // product based box shadow
                  BoxShadow(
                    color: product.color.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // priceWidget(product.price),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text("See More"),
                      SizedBox(width: 10),
                      Icon(
                        Icons.trending_up,
                        color: kPrimaryColor,
                        size: 18,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
