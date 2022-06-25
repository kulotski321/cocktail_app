import 'package:flutter/material.dart';

class CustomChipList extends StatelessWidget {
  final String category;
  final String glass;
  final String alcoholic;
  const CustomChipList(
      {Key? key,
      required this.category,
      required this.glass,
      required this.alcoholic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        runSpacing: 8.0,
        spacing: 8.0,
        children: [
          Chip(
            avatar: const Icon(Icons.category),
            label: Text(
              category,
              style: const TextStyle(
                fontFamily: 'Work Sans',
                fontSize: 12,
              ),
            ),
          ),
          Chip(
            avatar: const Icon(Icons.sports_bar),
            label: Text(
              glass,
              style: const TextStyle(
                fontFamily: 'Work Sans',
                fontSize: 12,
              ),
            ),
          ),
          Chip(
            avatar: const Icon(Icons.water_drop),
            label: Text(
              alcoholic,
              style: const TextStyle(
                fontFamily: 'Work Sans',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
