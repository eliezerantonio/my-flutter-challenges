class Account {
  int id;
  int clientId;
  String state;
  num balance;

  Account({this.id, this.clientId, this.state, this.balance});

  Account.fromJson(Map<String, dynamic> json) {
    id = json["data"]['id'];
    clientId = json["data"]['clientId'];
    state = json["data"]['state'];
    balance = json["data"]['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientId'] = this.clientId;
    data['state'] = this.state;
    data['balance'] = this.balance;
    return data;
  }

  @override
  String toString() {
    return "Account(id: $id, clientId: $clientId, state: $state, balance $balance )";
  }
}
