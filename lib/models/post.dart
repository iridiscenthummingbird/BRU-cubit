class Post {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  Post(this._userId, this._id, this._title, this._body);

  int get userId => _userId;
  int get id => _id;
  String get title => _title;
  String get body => _body;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      json["userId"] as int,
      json["id"] as int,
      json["title"] as String,
      json["body"] as String,
    );
  }
}
