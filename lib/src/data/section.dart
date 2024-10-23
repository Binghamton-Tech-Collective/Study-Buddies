import "utils.dart";
import "chat.dart";

extension type SectionId(String value) {}

class Section {
  final String sectionId;
  final String cRN;
  Chat chat;
 
  Section({
	required this.sectionId,
  required this.cRN,
  required this.chat,
  });

  Section.fromJson(Json json) :
  sectionId = json["sectionId"],
  cRN = json["cRN"],
	chat = json["chat"];

  Json toJson() => {
	"sectionId": sectionId,
	"chat": chat.toJson(),
  };
}
