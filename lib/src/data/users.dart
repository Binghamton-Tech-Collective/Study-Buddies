import "utils.dart";

extension type UserID(String value) {}

enum AvailabilityStatus {
  available,
  unavailable,
}

class User {
  final String username;
  final String email;
  final String fullName;
  final String bio;
  final String major;
  final String year;
  String? profileUrl;
  List<String>? interest;
  List<String>? courses;
  AvailabilityStatus isAvailable;
  final UserID userId;

  User({
    required this.username,
    required this.email,
    required this.fullName,
    required this.userId,
    required this.bio,
    required this.major,
    required this.year,
    this.profileUrl,
    this.interest,
    this.courses,
    this.isAvailable = AvailabilityStatus.available,
  });

  User.fromJson(Json json)
      : username = json["username"],
        email = json["email"],
        fullName = json["fullName"],
        profileUrl = json["profileUrl"],
        bio = json["bio"],
        major = json["major"],
        year = json["year"],
        courses = json["courses"]?.cast<String>(),
        interest = json["interest"]?.cast<String>(),
        isAvailable = AvailabilityStatus.values[json["isAvailable"] ?? 0],
        userId = UserID(json["userId"]);

  Json toJson() => {
        "username": username,
        "email": email,
        "fullName": fullName,
        "profileUrl": profileUrl,
        "bio": bio,
        "major": major,
        "year": year,
        "courses": courses,
        "interest": interest,
        "isAvailable": isAvailable.index,
        "userId": userId.value,
      };
}
