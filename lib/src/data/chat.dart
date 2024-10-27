import "utils.dart";

extension type ChatID(String value) {}

class Chat {
  final ChatID id;
  final List<String> messages;
  final Set<String> members;

  Chat({
    required this.id,
    required this.messages,
    required this.members,
  });

  factory Chat.start(ChatID id) => Chat(id: id, messages: [], members: {});

  Chat.fromJson(Json json) :
    id = json["id"],
    messages = json["messages"],
    members = json["members"];

  Json toJson() => {
    "id": id,
    "messages": messages,
    "members": members,
  };
}
