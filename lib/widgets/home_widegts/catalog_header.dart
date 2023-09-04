import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget{
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Catalog App",
            style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold
            ),),
          Text("Trending Products",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal
            ),),
        ],
      ),
    );
  }
}