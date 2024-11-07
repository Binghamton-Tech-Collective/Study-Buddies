import "utils.dart";
import "chat.dart";

extension type SectionID(String value) {}

class Section {
  final SectionID id;
  final ChatID chat;
 
  Section({
	required this.id,
  required this.chat,
  });

  Section.fromJson(Json json) :
  id = json["id"],
	chat = json["chat"];

  Json toJson() => {
	"id": id,
	"chat": id,
  };
}
