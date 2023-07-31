enum PublicationType { POST, POLL }

extension FirebasePublicationType on PublicationType {
  String get firebaseName {
    switch (this) {
      case PublicationType.POLL:
        return 'POLL';
      case PublicationType.POST:
        return 'POST';
    }
  }
}
