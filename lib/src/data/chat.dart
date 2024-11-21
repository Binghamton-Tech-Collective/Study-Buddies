import "utils.dart";
import "message.dart";

/// A ChatID extension type to prevent errors.
extension type ChatID(String value) {}

/// A UserID extension type to prevent errors.
extension type UserID(String value) {}

/// A class for the chat messages on the application.
class Chat {
  /// A unique ID.
  final ChatID id;
  /// A list of messages to contain the data for the chat.
  final List<Message> messages;
  /// A set of members within the chat.
  final Set<UserID> members;

  /// The constructor to create the chat object.
  Chat({
    required this.id,
    required this.messages,
    required this.members,
  });

  /// A method to start the chat object.
  factory Chat.start(ChatID id) => Chat(id: id, messages: [], members: {});

  /// A function to create JSON from the chat object.
  Chat.fromJson(Json json) :
    id = json["id"],
    messages = [
      for (final messageJson in json["messages"])
        Message.fromJson(messageJson),
    ],
    members = Set<UserID>.from(json["members"]);

  /// Convert this Chat to its JSON representation.
  Json toJson() => {
    "id": id,
    "messages": [
      for (final message in messages)
        message.toJson(),
    ],
    "members": members.toList(),
  };
}
