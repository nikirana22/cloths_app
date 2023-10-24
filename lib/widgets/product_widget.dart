import 'package:flutter/material.dart';
import '/model/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 242, 242, 1),
              borderRadius: BorderRadius.circular(12)),
          child: Image.network(
            product.link,
          ),
        ),
        const SizedBox(height: 8),
        Text(product.name),
        //rgba(246, 190, 0, 1)
        Text(
          'Worn ${product.times} times',
          style: const TextStyle(color: Color.fromRGBO(246, 190, 0, 1)),
        )
      ],
    );
  }
}
