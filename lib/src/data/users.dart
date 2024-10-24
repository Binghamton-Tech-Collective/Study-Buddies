import "utils.dart";

extension type UserID(String value) {}

enum AvailabilityStatus {
  available,
  unavailable,
}

class User {
  List<UserID>? blockedUser;

  User({this.blockedUser});

  User.fromJson(Json json) : blockedUser = json["blockedUser"]?.cast<String>();

  Json toJson() => {"blockedUser": blockedUser};
}
