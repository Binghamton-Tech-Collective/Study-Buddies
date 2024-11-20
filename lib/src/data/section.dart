import "utils.dart";
import "chat.dart";

extension type SectionID(String value) {}

/// A section for a specific course.
class Section {
  /// A unique ID.
  final SectionID id;
  /// A chat object for this section.
  final ChatID chat;
 
  Section({
	required this.id,
  required this.chat,
  });

  /// A function to create JSON from the section object.
  Section.fromJson(Json json) :
  id = json["id"],
	chat = json["chat"];

  /// Convert this Section to its JSON representation.
  Json toJson() => {
	"id": id,
	"chat": id,
  };
}
