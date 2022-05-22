import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/cupertino.dart';

import '../services/song_service.dart';
import 'deezer_song.dart';

class DeezerSongManager extends ChangeNotifier {
  DeezerSongManager() {
    initAcr();
  }
  final AcrCloudSdk acr = AcrCloudSdk();
  final songService = SongService();
  DeezerSong currentSong;
  bool isRecognizing = false;
  bool success = false;

  Future<void> initAcr() async {
    try {
      acr
        ..init(
          host: '', // https://www.acrcloud.com/
          accessKey: '',
          accessSecret: '',
          setLog: false,
        )
        ..songModelStream.listen(searchSong);
    } catch (e) {
      print("test ${e.toString()}");
    }
  }

  void searchSong(SongModel song) async {
    print("---------------${song.metadata}------------------------");
    final metaData = song?.metadata;
    if (metaData != null && metaData.music.isNotEmpty) {
      final trackId = metaData?.music[0]?.externalMetadata?.deezer?.track?.id;
      print("tractk id $trackId");
      try {
        final res = await songService.getTrack(trackId);
        currentSong = res;
        success = true;
        notifyListeners();
      } catch (e) {
        isRecognizing = false;
        success = false;
        notifyListeners();
      }
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
}
