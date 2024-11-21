import "chat.dart";
import "course.dart";
import "utils.dart";
import "semester.dart";

/// A section extension type to prevent errors.
extension type SectionID(String value) {}

/// What type of section is being held.
enum SectionType {
  /// A lecture section.
  lecture,

  /// A discussion section.
  discussion,

  /// An activity section.
  activity,

  /// A different kind of section.
  other;

  /// Chooses the right type from a JSON value.
  static SectionType fromJson(String json) => values.byName(json);

  /// Converts this type to JSON.
  String toJson() => name;
}

/// A section for a specific course.
///
/// A section is a specific "instance" of a course. A course is a general description of what will
/// be taught and how it counts for a major. A section itself is the actual group of students and
/// faculty in a course, when and where they meet, etc.
class Section {
  /// A unique ID for this section, likely a CRN.
  final SectionID id;

  /// What semester this section was held.
  final Semester semester;

  /// What type of section this is.
  final SectionType type;

  /// Misc details about this course.
  ///
  /// If details can be split out into separate fields, prefer that.
  final String details;

  /// A chat object for this section.
  final ChatID chat;

  /// A list of app users who are in this section.
  final Set<UserID> members;

  /// The course this section is associated with.
  final CourseID course;

  /// A constructor for the Section class.
  Section({
    required this.id,
    required this.semester,
    required this.type,
    required this.chat,
    required this.details,
    required this.members,
    required this.course,
  });

  /// A function to create JSON from the section object.
  Section.fromJson(Json json) :
    id = json["id"],
    semester = Semester.fromJson(json["semester"]),
    type = SectionType.fromJson(json["type"]),
    members = Set<UserID>.from(json["members"]),
    details = json["details"],
    course = json["course"],
    chat = json["chat"];

  /// Convert this Section to its JSON representation.
  Json toJson() => {
    "id": id,
    "type": type.toJson(),
    "semester": semester.toJson(),
    "members": members.toList(),
    "details": details,
    "course": course,
    "chat": id,
  };
}
