
class Account {
  int id;
  int clientId;
  String state;
  int balance;

  Account({this.id, this.clientId, this.state, this.balance});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    state = json['state'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientId'] = this.clientId;
    data['state'] = this.state;
    data['balance'] = this.balance;
    return data;
  }
}