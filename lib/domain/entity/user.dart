class User {
  final int id;
  final String name;
  final String email;
  final String image;

  User(this.id, this.name, this.email, this.image);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        image = 'lego-${json['id']}.jpeg';
}
