

class User{
  String name;
  String phoneNumber;

  User({required this.name ,required this.phoneNumber});

  static User empty = User(name: '', phoneNumber: '');
}