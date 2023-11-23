class KUser {
  String? uid;
  String? nickname;

  KUser({
    this.nickname,
    this.uid,
  });

  factory KUser.fromJson(Map<String, dynamic> json) {
    return KUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      nickname: json['nickname'] == null ? '' : json['nickname'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickname': nickname,
    };
  }
}
