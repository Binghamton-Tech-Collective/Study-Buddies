import "course.dart";
import "utils.dart";

/// Represents information about a normal user.
class UserProfile {
  /// The user's name.
  final String name;

  /// The user's current courses.
  final Set<CourseID> currentCourses;

  /// The user's past courses.
  final Set<CourseID> pastCourses;

  /// The courses the user can teach/tutor.
  final Set<CourseID> canTeach;

  /// The user's current school year.
  final SchoolYear year;

  /// The URL to the user's profile image.
  final String? imageUrl;

  /// The user's profile bio.
  final String bio;

  /// The user's major.
  final String major;

  /// The user's email.
  final String email;

  /// The user's availability.
  final AvailabilityStatus isAvailable;

  /// The unique user id.
  final UserID userId;

  /// Creates a seller's profile.
  const UserProfile({
    required this.name,
    required this.currentCourses,
    required this.pastCourses,
    required this.canTeach,
    required this.year,
    required this.imageUrl,
    required this.bio,
    required this.major,
    required this.email,
    required this.isAvailable,
    required this.userId,
  });

  /// Creates a new UserProfile object from a JSON object.
  UserProfile.fromJson(Json json) :
    name = json["name"],
    currentCourses = Set<CourseID>.from(json["currentCourses"]),
    pastCourses = Set<CourseID>.from(json["pastCourses"]),
    canTeach = Set<CourseID>.from(json["canTeach"]),
    year = SchoolYear.values[json["year"]],
    imageUrl = json["imageUrl"],
    bio = json["bio"],
    major = json["major"],
    email = json["email"],
    isAvailable = AvailabilityStatus.values[json["isAvailable"] ?? 0],
    userId = json["userId"];

  /// Convert this UserProfile to its JSON representation
  Json toJson() => {
    "name": name,
    "currentCourses": currentCourses,
    "pastCourses": pastCourses,
    "canTeach": canTeach,
    "year": year.index,
    "imageUrl": imageUrl,
    "bio": bio,
    "major": major,
    "email": email,
    "isAvailable": isAvailable.index,
    "userId": userId,
  };
}

/// A year in school
enum SchoolYear {
  freshman,
  sophomore,
  junior,
  senior,
  graduate,
  faculty;
}

enum AvailabilityStatus {
  available,
  unavailable,
}
