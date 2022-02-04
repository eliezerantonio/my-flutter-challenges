import 'package:flutter/material.dart';
import 'package:nocinema/models/trailer.dart';
import 'package:nocinema/screens/play/play_trailer.dart';
import 'package:nocinema/theme/theme.dart';
import 'package:provider/provider.dart';

class TrailersScreen extends StatelessWidget {
  const TrailersScreen({Key? key, required this.trailers}) : super(key: key);
  final List<Video> trailers;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeChanger>(context).darkTheme;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: darkTheme ? Colors.grey[850] : Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: !darkTheme ? Colors.grey[850] : Colors.white,
            ),
          ),
        ),
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            Video video = trailers[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PlayTrailer(id: video.id)));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(video.imagem),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    ListTile(
                      title: Text(video.title),
                      subtitle: Text(video.channel),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 2,
            color: Colors.grey,
          ),
          itemCount: trailers.length,
        ));
  }
}
