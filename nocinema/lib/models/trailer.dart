class Video {
  String id;
  String title;
  String description;
  String imagem;
  String channel;

  Video({ required this.id, required  this.title, required this.description, required this.imagem,required this.channel});

//com factory o reotorno sera de um unico objecto
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      description: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelTitle"],
    );
  }
}