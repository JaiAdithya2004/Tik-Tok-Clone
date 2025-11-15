import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comment {
  String comment;
  String username;
  List likes;
  String profilePic;
  final datePublished;
  String uid;
  String id;
  Comment({
    required this.comment,
    required this.username,
    required this.likes,
    required this.profilePic,
    required this.uid,
    required this.id,
    required this.datePublished,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comment': comment,
      'username': username,
      'likes': likes,
      'profilePic': profilePic,
      'datePublished': datePublished,
      'uid': uid,
      'id': id,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      comment: map['comment'] as String,
      username: map['username'] as String,
      likes: List.from((map['likes'] as List)),
      profilePic: map['profilePic'] as String,
      uid: map['uid'] as String,
      datePublished: map['datePublished'] as dynamic,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
