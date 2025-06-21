class AppUser {
  final String uid;
  final String email;
  final DateTime sessionExpiration;

  AppUser({
    required this.uid,
    required this.email,
    required this.sessionExpiration,
  });

  Map<String, dynamic> toMap() => {'uid': uid, 'email': email};

  factory AppUser.fromMap(
    Map<String, dynamic> map,
    DateTime sessionExpiration,
  ) => AppUser(
    uid: map['uid'] as String,
    email: map['email'] as String,
    sessionExpiration: sessionExpiration,
  );

  bool get isExpired => sessionExpiration.isBefore(DateTime.now());
}
