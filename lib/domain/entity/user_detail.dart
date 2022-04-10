class UserDetail {
  final int id;
  final String name;
  final String email;
  final String image;
  final String phone;
  final String country;
  final String city;

  UserDetail(this.id, this.name, this.email, this.image, this.phone, this.country, this.city);

  UserDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        image = 'lego-${json['id']}.jpeg',
        phone = json['phone'],
        country = json['country'],
        city = json['city'];
}
