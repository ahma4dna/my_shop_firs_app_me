import 'package:flutter/material.dart';

class ViewerImage extends StatelessWidget {
  const ViewerImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 3.0,
      minScale: 0.5,
      panEnabled: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Hero(
              tag: image,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
