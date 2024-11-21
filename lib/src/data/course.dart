import "utils.dart";
import "chat.dart";
import "semester.dart";

/// A CourseID extension type to prevent errors.
extension type CourseID(String value) {}

/// A class for each BU course.
///
/// Note that courses are different than sections, and courses usually have more than one section.
/// Courses are differentiated by [semester]. Instead of listing sections here, use a query to find
/// sections assigned to this course.
class Course {
  /// A unique ID for this course.
  CourseID get id => CourseID("${semester.toJson()}-$department-$courseNumber");

  /// Department of this course.
  final String department;

  /// Course number for this course.
  final int courseNumber;

  /// The title of this course.
  final String title;

  /// Chat object for this course.
  final Chat chat;

  /// The semester this course took place.
  final Semester semester;

  /// A constructor for the Course class
  Course({
    required this.semester,
    required this.department,
    required this.courseNumber,
    required this.title,
    required this.chat,
  });

  /// A function to create JSON from the course object.
  Course.fromJson(Json json) :
    semester = Semester.fromJson(json["semester"]),
    department = json["department"],
    courseNumber = json["courseNumber"],
    title = json["title"],
    chat = json["chat"];

  /// Convert this Course to its JSON representation.
  Json toJson() => {
    "department": department,
    "courseNumber": courseNumber,
    "semester": semester.toJson(),
    "title": title,
    "chat": chat.toJson(),
  };
}
