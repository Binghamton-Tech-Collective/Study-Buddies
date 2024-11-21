import "utils.dart";

extension type UserID(String value) {}

enum AvailabilityStatus {
  available,
  unavailable,
}

class User {
  final List<UserID> blockedUsers;
  final UserID userID;

  User({
    required this.blockedUsers,
    required this.userID,
  });

  User.fromJson(Json json) :
    blockedUsers = List<UserID>.from(json["blockedUsers"]),
    userID = json["userID"];

  Json toJson() => {
    "blockedUsers": blockedUsers,
    "userID": userID,
  };
}
