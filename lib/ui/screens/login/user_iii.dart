class User {

  String name;
  int age;
  String home;

  User({this.name = "", this.age = 0, this.home = 'Earth'});
  // User(this.name, this.age, {this.home = 'Earth'});
}

User user1 = User(name: 'Bob');
User user2 = User(name: 'Bob', home: 'Mars', age: 10);