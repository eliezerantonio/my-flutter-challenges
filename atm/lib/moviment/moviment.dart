class Moviment {
  int _id;
  int _accountId;
  int _employeeId;
  num _balance;
  String _operation;
  DateTime _createdAt;

  Moviment.fromJSON(Map<String, dynamic>json) {
    
  }


  Moviment.toJSON() {}


  int get id => this._id;

  set id(int value) => this._id = value;

  get accountId => this._accountId;

  set accountId(value) => this._accountId = value;

  get employeeId => this._employeeId;

  set employeeId(value) => this._employeeId = value;

  get balance => this._balance;

  set balance(value) => this._balance = value;

  get operation => this._operation;

  set operation(value) => this._operation = value;

  get createdAt => this._createdAt;

  set createdAt(value) => this._createdAt = value;
}
