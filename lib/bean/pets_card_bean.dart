class PetsCardBean {
  final String coverUrl;
  final User user;
  final String postTime;
  final String tag;
  final String post;
  final int comments;
  int likes;
  final int shares;

  PetsCardBean(this.coverUrl, this.user, this.postTime, this.tag, this.post,
      this.comments, this.likes, this.shares);
}

class User {
  final String name;
  final String info;
  final String avatar;

  User(this.name, this.info, this.avatar);

  @override
  String toString() => "{name: $name, info: $info, avatar: $avatar}";
}

PetsCardBean mockPetsPost() {
  return PetsCardBean(
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1425538345,901220022&fm=26&gp=0.jpg",
      User("chengww", "我的云猫咪小 V",
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg"),
      "14:55",
      "萌宠小屋",
      "今天带着小 V 去了爪子体验馆，好多好玩的。好像带回家！大家有去过的吗？",
      356,
      126,
      89);
}
