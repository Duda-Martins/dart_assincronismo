class Account {
  String id;
  String name;
  String lastName;
  double balance;

  Account({
    required this.id, required this.name, required this.lastName, required this.balance
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      balance: map['balance'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'balance': balance,
    };
  }
}