import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HotOfferItem extends StatelessWidget {
  final String imageUrl;
  final String description;
  const HotOfferItem({
    super.key,
    required this.imageUrl,
    required this.description,
    });

  @override
  Widget build(BuildContext context) {
    return Card(
     color: const Color(0xffE6879A).withOpacity(0.7), 
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10)
      ),
      elevation: 2,
      child: ListTile(
leading: ClipRRect(
  borderRadius: BorderRadiusGeometry.circular(8),
  child: Image.asset(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
),
title: Text(description.tr()),
      ),
    );
  }
}