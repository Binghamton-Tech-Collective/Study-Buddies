import "utils.dart";

/// A message extension type to prevent errors.
extension type MessageId(String value) {}
/// A UserID extension type to prevent errors.
extension type UserID(String value) {}

/// Each message in the chat data class.
class Message {
  /// A unique ID for the message.
  final MessageId id;
  /// The content of the message.
  final String content;
  /// The author of the message.
  final UserID author;
  /// The timestamp when the message was made.
  final DateTime timestamp;

  /// A constructor to create the message object.
  Message({required this.id, required this.content, required this.author, required this.timestamp});

  /// A function to create JSON from the Message object.
  Message.fromJson(Json json) :
	id = json["id"],
	content = json["content"],
	author = json["author"],
	timestamp = json["timestamp"];

  /// Convert this Message to its JSON representation.
  Json toJson() => {
	"id": id,
	"content": content,
	"author": author,
	"timestamp": timestamp,
  };
}
