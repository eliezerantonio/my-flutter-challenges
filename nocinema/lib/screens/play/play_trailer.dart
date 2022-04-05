import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nocinema/theme/theme.dart';
import 'package:nocinema/utils/myBackgroundColors.dart';
import 'package:nocinema/utils/responsive.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
      params: YoutubePlayerParams(showControls: true, autoPlay: true),
    );
    _controller.setSize(Size(double.infinity, double.infinity));
  }

  @override
  void dispose() {
    _controller.close();
    _controller.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeChanger>(context).darkTheme;
    final responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkTheme ? darkColor : Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: !darkTheme ? darkColor : Colors.white,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.grey[700],
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Center(
              child: YoutubePlayerIFrame(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
