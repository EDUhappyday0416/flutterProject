import 'package:flutter/material.dart';
import 'package:flutter_project/data/data.dart';
import 'package:flutter_project/utils/utils.dart';

class NutrientWidget extends StatelessWidget {
  final Product product;
  final int index;

  const NutrientWidget({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.nutrients[index][0],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${product.nutrients[index][1]}/5",
                style: TextStyle(
                  color: product.nutrientsColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),

          // building the indicators
          Row(
            children: buildIndicators(
              product.nutrients[index][0],
              int.parse(product.nutrients[index][1]),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildIndicators(String nutrientType, int value) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(
        i < value
            ? indicator(true, nutrientType)
            : indicator(false, nutrientType),
      );
    }
    return list;
  }

  Widget indicator(bool isActive, String nutrientType) {
    IconData icon;
    switch (nutrientType) {
      case "Energy":
        icon = Icons.favorite;
        break;
      case "Freshness":
        icon = Icons.favorite;
        break;
      case "Vitamin":
        icon = Icons.favorite;
        break;
      default:
        icon = Icons.favorite;
        break;
    }
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0),
      child: Icon(
        icon,
        color: isActive == true ? product.nutrientsColor : Colors.black12,
        size: 16,
      ),
    );
  }
}
