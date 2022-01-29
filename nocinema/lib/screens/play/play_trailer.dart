import 'package:flutter/material.dart';
import 'package:nocinema/theme/theme.dart';
import 'package:nocinema/utils/myBackgroundColors.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlayTrailer extends StatefulWidget {
  PlayTrailer({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<PlayTrailer> createState() => _PlayTrailerState();
}

class _PlayTrailerState extends State<PlayTrailer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.reset();
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.grey[850]),
      body: Center(
        child: YoutubePlayerIFrame(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
