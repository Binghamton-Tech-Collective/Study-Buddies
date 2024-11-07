import "utils.dart";
import "message.dart";

extension type ChatID(String value) {}
extension type UserID(String value) {}

class Chat {
  final ChatID id;
  final List<Message> messages;
  final Set<UserID> members;

  Chat({
    required this.id,
    required this.messages,
    required this.members,
  });

  factory Chat.start(ChatID id) => Chat(id: id, messages: [], members: {});

  Chat.fromJson(Json json) :
    id = json["id"],
    messages = [
      for (final messageJson in json["messages"])
        Message.fromJson(messageJson),
    ],
    members = json["members"];

  Json toJson() => {
    "id": id,
    "messages": [
      for (final message in messages)
        message.toJson(),
    ],
    "members": members,
  };
}
