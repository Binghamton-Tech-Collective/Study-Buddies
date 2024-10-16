import "utils.dart";

enum GroupStatus {
  openToAll,
  openByRequest,
  private,
}

class Group {
  final String id;
  final String name;
  final List<String> members; 
  int? memberLimit;
  GroupStatus status;

  Group({
    required this.id,
    required this.name,
    required this.members,
    required this.status,
    this.memberLimit, 
  });

  // Method to add a member
  bool addMember(String memberId) {
    if (memberLimit == null || members.length < memberLimit!) {
      members.add(memberId);
      return true;
    }
    return false;
  }

  Group.fromJson(Json json) :
    id = json["id"],
    name = json["name"],
    members = json["members"],
    status = json["status"],
    memberLimit = json["memberLimit"];

  Json toJson() => {
    "id": id,
    "name": name,
    "members": members,
    "status": status,
    "memberLimit": memberLimit,
  };
}
