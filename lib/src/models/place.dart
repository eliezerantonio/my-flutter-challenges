class Place {
  final String id;
  final String title;
  final String capital;
  final String description;
  final dynamic imageUrl;
  final String climate;
  final String temperature;
  bool isFavorite;

  Place({
    this.id,
    this.title,
    this.capital,
    this.imageUrl,
    this.climate,
    this.temperature,
    this.description,
    this.isFavorite = false,
  });
}
