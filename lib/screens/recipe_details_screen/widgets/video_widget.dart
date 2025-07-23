import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/video_player_provider/video_player_provider.dart';

import '../../../resources/app_colors.dart';

class VideoWidget extends ConsumerWidget {
  final String videoUrl;

  final String recipeAvatar;
  final VoidCallback playVideo;

  const VideoWidget({
    super.key,
    required this.videoUrl,
    required this.recipeAvatar,
    required this.playVideo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoRecipeAsync = ref.watch(RecipeVideoPlayerProvider(videoUrl));
    return videoRecipeAsync.when(
      data: (_) {
        final videoNotifier = ref.read(recipeVideoPlayerProvider(videoUrl).notifier);
        return AspectRatio(
          aspectRatio: 840 / 600,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              children: [
                Positioned.fill(child: Chewie(controller: videoNotifier.chewieController)),
                if (!videoNotifier.isPlaying)
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: recipeAvatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (!videoNotifier.isPlaying)
                  Center(
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 255, 255, 0.8),
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
      },
      error: (error, stack) => Text('Error: $error'),
      loading: () => CircularProgressIndicator(),
    );
  }
}
