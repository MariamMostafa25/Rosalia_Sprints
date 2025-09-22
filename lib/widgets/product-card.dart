import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rosalia_sprints/models/product.dart';
class productCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;
  const productCard

  ({
    super.key,
  required this.product,
    required this.onTap,
    required this.onAddToCart,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
       color: const Color(0xffE6879A).withOpacity(0.7), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(product.imageUrl,fit: BoxFit.cover,),
            )),
         /*   Container(
  decoration: const BoxDecoration(
    color: const Color(0xFFE6879A),  // ✅ لون الخلفية (هنا وردي فاتح)
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
  ),),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.nameKey.tr(), 
                  style: TextStyle(fontWeight: FontWeight.bold),),
                 const SizedBox(height: 4,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("\$${product.price.toStringAsFixed(2)}"),
IconButton(color: Colors.pink,
  onPressed: onAddToCart,
   icon: const Icon(Icons.add_shopping_cart))

                 ] )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
