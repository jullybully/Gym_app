import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final String imageProduct;
  final String nameProduct;
  final String priceProduct;

  const ProductView({
    super.key,
    required this.imageProduct,
    required this.nameProduct,
    required this.priceProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        bottom: 100,
      ),
      child: Container(
          padding: EdgeInsets.all(12),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(imageProduct),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameProduct,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Protein',
                          style: TextStyle(fontSize: 15),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$$priceProduct'),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
