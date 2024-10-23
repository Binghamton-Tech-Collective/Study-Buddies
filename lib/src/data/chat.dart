import "utils.dart";

extension type ChatId(String value) {}

class Chat {
  List<String> messages;
  Set<String> members;
 
  Chat({ required this.messages, required this.members});

  factory Chat.start() => Chat(messages: [], members: {});

  Chat.fromJson(Json json) :
	messages = json["messages"],
	members = json["members"];

  Json toJson() => {
	"messages": messages,
	"members": members,
  };
}
