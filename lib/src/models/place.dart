class Place {
  final String id;
  final String title;
  final String capital;
  final String description;
  final String imageUrl;
  final String climate;
  final String temperature;
  bool isFavorite;
  final List<List<List>> points;

  Place({
    this.id,
    this.title,
    this.capital,
    this.imageUrl,
    this.climate,
    this.temperature,
    this.description,
    this.isFavorite = false,
    this.points,
  });
}
