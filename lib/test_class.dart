enum GroupStatus {
  openToAll,
  openByRequest,
  private,
}

class Group {
  final String id;
  final String name;
  final List<String> members; 
  final int memberLimit;
  final GroupStatus status;

  Group({
    required this.id,
    required this.name,
    required this.members,

    // Unsure about how we should handle this, restricted by users or by app?
    // Additonaly, adding a member limit seems a little unesscary
    required this.memberLimit, 
    
    required this.status,
  });

  // Method to add a member
  bool addMember(String memberId) {
    if (members.length < memberLimit) {
      members.add(memberId);
      return true;
    }
    return false;
  }

  // Method to check if a member can join based on status
  bool canJoin(String memberId) {
    if (status == GroupStatus.openToAll) {
      return true; 
    } else if (status == GroupStatus.openByRequest) {
      // Need request logic here
      return false; 
    } else {
      return false; 
    }
  }
}
