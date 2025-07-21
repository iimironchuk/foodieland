import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class VideoWidget extends StatelessWidget {
  final bool isPlaying;
  final bool isPaused;
  final ChewieController chewieController;
  final String recipeAvatar;
  final VoidCallback playVideo;
  const VideoWidget({super.key, required this.isPlaying, required this.isPaused, required this.chewieController, required this.recipeAvatar, required this.playVideo});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 840 / 600,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Positioned.fill(
              child: Chewie(controller: chewieController),
            ),
            if (!isPlaying && !isPaused)
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: recipeAvatar,
                  fit: BoxFit.cover,
                ),
              ),
            if (!isPlaying && !isPaused)
              Center(
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(
                      255,
                      255,
                      255,
                      0.8,
                    ),
                  ),
                  child: IconButton(
                    onPressed: playVideo,
                    icon: Icon(
                      Icons.play_arrow,
                      color: AppColors.lightGrey,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
