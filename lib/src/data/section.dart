import "chat.dart";
import "course.dart";
import "utils.dart";

/// A section extension type to prevent errors.
extension type SectionID(String value) {}

/// A section for a specific course.
class Section {
  /// A unique ID.
  final SectionID id;

  /// A chat object for this section.
  final ChatID chat;

  /// The course this section is associated with.
  final CourseID course;

  /// A constructor for the Section class.
  Section({
    required this.id,
    required this.chat,
    required this.course,
  });

  /// A function to create JSON from the section object.
  Section.fromJson(Json json) :
    id = json["id"],
    course = json["course"],
    chat = json["chat"];

  /// Convert this Section to its JSON representation.
  Json toJson() => {
    "id": id,
    "chat": id,
  };
}
