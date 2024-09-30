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
  String? profileUrl;
  List<String>? interest;
  AvailabilityStatus isAvailable;
  final UserID userId;

  User({
    required this.username,
    required this.email,
    required this.fullName,
    required this.userId,
    this.profileUrl,
    this.interest,
    this.isAvailable = AvailabilityStatus.available,
  });

  User.fromJson(Json json)
      : username = json["username"],
        email = json["email"],
        fullName = json["fullName"],
        profileUrl = json["profileUrl"],
        interest = json["interest"]?.cast<String>(),
        isAvailable = AvailabilityStatus.values[json["isAvailable"] ?? 0],
        userId = UserID(json["userId"]);

  Json toJson() => {
        "username": username,
        "email": email,
        "fullName": fullName,
        "profileUrl": profileUrl,
        "interest": interest,
        "isAvailable": isAvailable.index,
        "userId": userId.value,
      };
}
