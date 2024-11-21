import "utils.dart";

/// A unique identifier for a user.
extension type UserID(String value) {}

/// The availability status of a user.
enum AvailabilityStatus {
  /// User is available.
  available,

  /// User is unavailable.
  unavailable,
}

/// Represents a user and their blocked users.
class User {
  /// A list of users that this user has blocked.
  final List<UserID> blockedUsers;

  /// The unique identifier for the user.
  final UserID userID;

  /// Constructor for creating a User with the specified blockedUsers and userID.
  User({
    required this.blockedUsers,
    required this.userID,
  });

  /// Creates a User instance from a JSON map.
  /// The json map should contain the keys `blockedUsers` and `userID`.
  User.fromJson(Json json)
      : blockedUsers = List<UserID>.from(json["blockedUsers"]),
        userID = json["userID"];

  /// Converts the User instance to a JSON map.
  /// The returned map contains the keys `blockedUsers` and `userID`.
  Json toJson() => {
        "blockedUsers": blockedUsers,
        "userID": userID,
      };
}
