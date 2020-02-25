class User {
  String name;
  String userName;
  List posts;
  int likes;
  int phoneNumber;


  User(this.name, this.userName, this.posts, this.likes, this.phoneNumber);

  Map<String, dynamic> toJson() => {
    'name' : name,
    'userName' : userName,
    'posts' : posts,
    'likes': likes,
    'phoneNumber' : phoneNumber,
  };
}
