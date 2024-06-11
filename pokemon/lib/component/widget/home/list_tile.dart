import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final ImageProvider thumbnail;
  final String title;
  final Color? color;

  const ListTileWidget({
    super.key,
    required this.title,
    required this.thumbnail,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 36),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: thumbnail,
              width: 110,
              height: 66,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
