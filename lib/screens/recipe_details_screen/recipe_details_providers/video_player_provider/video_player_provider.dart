import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_player_provider.g.dart';

@riverpod
class RecipeVideoPlayer extends _$RecipeVideoPlayer {
  late VideoPlayerController _controller;

  bool _isStopped = false;
  bool _isPlaying = false;
  bool _isPaused = false;

  @override
  Future<void> build(String videoUrl) async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await _controller.initialize();

    ref.onDispose(() {
      _controller.dispose();
    });
  }

  Future<void> playVideo() async {
    await _controller.play();
    _isPlaying = true;
    _isPaused = false;
    _isStopped = false;
    state = AsyncData(null);
  }

  Future<void> pauseVideo() async {
    await _controller.pause();
    _isPlaying = false;
    _isPaused = true;
    _isStopped = false;
    state = AsyncData(null);
  }

  Future<void> stopVideo() async {
    await _controller.pause();
    await _controller.seekTo(Duration.zero);
    _isPlaying = false;
    _isPaused = false;
    _isStopped = true;
    state = AsyncData(null);
  }

  bool get isPlaying => _isPlaying;
  bool get isPaused => _isPaused;
  bool get isStopped => _isStopped;
  VideoPlayerController get controller => _controller;
}
