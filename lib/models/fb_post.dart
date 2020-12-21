import 'dart:convert';

class FB_POST {
  final String user_name;
  final String avatar;
  final int post;
  final String image_url;
  final int comments;
  final int likes;
  final int shares;
  final int id;

  FB_POST({
    this.user_name,
    this.avatar,
    this.post,
    this.image_url,
    this.comments,
    this.likes,
    this.shares,
    this.id,
  });

  factory FB_POST.fromJson(Map<dynamic, dynamic> json) {
    return FB_POST(
        user_name: json['user_name'],
        avatar: json['avatar'],
        post: json['post'],
        image_url: json['image_url'],
        comments: json['comments'],
        likes: json['likes'],
        shares: json['shares'],
        id: json['id']);
  }
  static List<FB_POST> getPost(String data) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    return parsed.map<FB_POST>((json) => FB_POST.fromJson(json)).toList();
  }
}
