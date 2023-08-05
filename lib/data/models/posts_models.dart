import 'dart:convert';

List<PostData> postsFromJson(String str) => List<PostData>.from(
      jsonDecode(str).map(
        (x) => PostData.fromJson(x),
      ),
    );

PostData postFromJson(String str) => PostData.fromJson(
      jsonDecode(str),
    );

class PostData {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostData({this.userId, this.id, this.title, this.body});

  PostData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
