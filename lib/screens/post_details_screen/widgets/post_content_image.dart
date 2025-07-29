import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostContentImage extends StatelessWidget {
  final String imageUrl;
  final double bottomPadding;
  final double aspectRatio;
  const PostContentImage({super.key, required this.imageUrl, required this.bottomPadding, required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
