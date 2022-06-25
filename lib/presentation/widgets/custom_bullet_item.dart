import 'package:flutter/material.dart';

class CustomBulletItem extends StatelessWidget {
  final String itemName;
  const CustomBulletItem({Key? key, required this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        '\u2022 $itemName',
        style: const TextStyle(
          fontFamily: 'Work Sans',
          fontSize: 17,
        ),
      ),
    );
  }
}
