class Coffee {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final num price;
  bool isFavorite;

  Coffee({
    this.id,
    this.description,
    this.imageUrl,
    this.isFavorite = false,
    this.name,
    this.price,
  });
}
