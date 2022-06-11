import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/cupertino.dart';

import '../services/song_service.dart';
import 'deezer_song.dart';

class DeezerSongManager extends ChangeNotifier {
  DeezerSongManager() {
    initAcr();
  }
  final songService = SongService();
  final AcrCloudSdk acr = AcrCloudSdk();
  DeezerSong currentSong;
  bool isRecognizing = false;
  bool success = false;

  Future<void> initAcr() async {
    try {
      acr
        ..init(
          host: 'identify-eu-west-1.acrcloud.com', // https://www.acrcloud.com/
          accessKey:
              '32638b33ecce7a701b6a3299b2d7fe85', // https://www.acrcloud.com/
          accessSecret:
              'barilSkcK82uxhNvO7jBGYTKliw4rsVPG4mYzqPm', // https://www.acrcloud.com/
          setLog: false,
        )
        ..songModelStream.listen(searchSong);
    } catch (e) {
      print("test ${e.toString()}");
    }
  }

  void searchSong(SongModel song) async {
    print("---------------${song.metadata}------------------------");
    if (song.metadata == null) {
      stopRecognizing();
      return;
    }

    final metaData = song?.metadata;
    if (metaData != null && metaData.music.isNotEmpty) {
      final trackId = metaData?.music[0]?.externalMetadata?.deezer?.track?.id;
      try {
        final res = await songService.getTrack(trackId);
        currentSong = res;
        success = true;
        isRecognizing = false;
        await acr.stop();
        notifyListeners();
      } catch (e) {
        isRecognizing = false;
        success = false;
        notifyListeners();
      }
    }
  }

  Future<void> stopRecognizing() async {
    isRecognizing = false;
    success = false;
    notifyListeners();
    try {
      await acr.stop();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> startRecognizing() async {
    isRecognizing = true;
    success = false;
    notifyListeners();
    try {
      await acr.start();
    } catch (e) {
      print(e.toString());
      stopRecognizing();
    }
  }
}
