import 'package:chewie/chewie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_player_provider.g.dart';

@riverpod
class RecipeVideoPlayer extends _$RecipeVideoPlayer {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  bool _isPlaying = false;
  bool _isVideoInitialized = false;

  @override
  Future<void> build(String videoUrl) async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await _controller.initialize();

    _chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: false,
      looping: false,
    );

    _isVideoInitialized = true;

    ref.onDispose(() {
      _controller.dispose();
      _chewieController.dispose();
    });
  }

  Future<void> playVideo() async {
    await _controller.play();
    _isPlaying = true;
    state = AsyncData(null);
  }

  bool get isPlaying => _isPlaying;

  bool get isVideoInitialized => _isVideoInitialized;

  VideoPlayerController get controller => _controller;

  ChewieController get chewieController => _chewieController;
}
