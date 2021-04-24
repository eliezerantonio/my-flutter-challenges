class Client {
  String name;
  String genre;
  String email;
  String bi;
  DateTime birthDate;
  String phone;
  String token;

  Client.fromJSON(Map<String, dynamic> map) {
    Map mapData = map["data"]["client"];

    this.name = mapData["name"];
    this.bi = mapData["bi"];
    this.email = mapData["email"];
    this.genre = mapData["genre"];
    this.phone = mapData["phone"];
    this.token = map["data"]["token"];
    this.birthDate = DateTime.tryParse(mapData["birthDate"]);
  }
  @override
  String toString() {
    return "Client(name: $name, genre: $genre, email $email, bi: $bi, birthDate: $birthDate, phone: $phone, token: $token)";
  }
}
