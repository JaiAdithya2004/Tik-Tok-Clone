import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Video {
  String username;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String videoUrl;
  String thumbnail;
  String songName;
  String caption;
  String profilePhoto;
  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.videoUrl,
    required this.thumbnail,
    required this.songName,
    required this.caption,
    required this.profilePhoto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'uid': uid,
      'id': id,
      'likes': likes,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'songName': songName,
      'caption': caption,
      'profilePhoto': profilePhoto,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      username: map['username'] as String,
      uid: map['uid'] as String,
      id: map['id'] as String,
      likes: List.from((map['likes'] as List)),
      commentCount: map['commentCount'] as int,
      shareCount: map['shareCount'] as int,
      videoUrl: map['videoUrl'] as String,
      thumbnail: map['thumbnail'] as String,
      songName: map['songName'] as String,
      caption: map['caption'] as String,
      profilePhoto: map['profilePhoto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);
}
