import "utils.dart";
import "chat.dart";

class Section {
  final String section_id;
  final String CRN;
  Chat chat;
 
  Section({
	required this.section_id,
  }) {
	this.chat = Chat()
  };

  Foo.fromJson(Json json) :
	this.chat = json["chat"],

  Json toJson() => {
	"section_id": this.section_id,
	"chat": this.chat.toJson(),
  };
}
