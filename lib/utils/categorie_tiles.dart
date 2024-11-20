import 'package:flutter/material.dart';

class CategorieTiles extends StatelessWidget {
  final Color tilesColor;
  final String categorieTitle;
  const CategorieTiles({
    super.key,
    required this.tilesColor,
    required this.categorieTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: tilesColor,
            child: Image.asset(
              "assets/images/oats.png",
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            categorieTitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
