class User {
  bool success;
  String message;
  int totalUsers;
  int offset;
  int limit;
  List<UserElement> users;

  User({
    required this.success,
    required this.message,
    required this.totalUsers,
    required this.offset,
    required this.limit,
    required this.users,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        message: json["message"],
        totalUsers: json["total_users"],
        offset: json["offset"],
        limit: json["limit"],
        users: List<UserElement>.from(
            json["users"].map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "total_users": totalUsers,
        "offset": offset,
        "limit": limit,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class UserElement {
  int id;
  String gender;
  DateTime dateOfBirth;
  String job;
  String city;
  String zipcode;
  double latitude;
  String profilePicture;
  String email;
  String firstName;
  String lastName;
  String phone;
  String street;
  String state;
  String country;
  double longitude;

  UserElement({
    required this.id,
    required this.gender,
    required this.dateOfBirth,
    required this.job,
    required this.city,
    required this.zipcode,
    required this.latitude,
    required this.profilePicture,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.street,
    required this.state,
    required this.country,
    required this.longitude,
  });

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        job: json["job"],
        city: json["city"],
        zipcode: json["zipcode"],
        latitude: json["latitude"]?.toDouble() ?? 0.0,
        profilePicture: json["profile_picture"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        street: json["street"],
        state: json["state"],
        country: json["country"],
        longitude: json["longitude"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gender": gender,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "job": job,
        "city": city,
        "zipcode": zipcode,
        "latitude": latitude,
        "profile_picture": profilePicture,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "street": street,
        "state": state,
        "country": country,
        "longitude": longitude,
      };
}
