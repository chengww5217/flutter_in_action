
import 'package:flutter_in_action/bean/pets_card_bean.dart';

class WeChatMomentsBean {
  final User user;
  final String post;
  final Attachment attachment;
  final String time;
  final List<Comment> comments;

  WeChatMomentsBean(
      this.user, this.post, this.attachment, this.time, this.comments);
}

class Comment {
  final User user;
  final User replayTo;
  final String content;

  Comment(this.user, this.replayTo, this.content);
}

class ImageAttachment extends Attachment {
  final String url;

  // For simple use, we use url to replace data
  ImageAttachment(this.url) : super(AttachmentType.IMAGE, url);
}

abstract class Attachment {
  final AttachmentType type;
  final String data;

  const Attachment(this.type, this.data);
}

enum AttachmentType { IMAGE, VIDEO, URL }

List<Comment> _mockComments() => [
      Comment(_nameUser("若海"), null, "性能如何"),
      Comment(_nameUser("chengww"), _nameUser("若海"), "性能不错，就是开发体验差点。。。"),
      Comment(_nameUser("若海"), _nameUser("chengww"), "周末我也试试，嘻嘻☺️"),
      Comment(_nameUser("大佬"), null, "卧槽，求求你别学了"),
      Comment(_nameUser("chengww"), _nameUser("大佬"), "卧槽，大佬别闹，学不动了。。。"),
      Comment(_nameUser("产品"), null, "工作量不饱和啊你这是！"),
      Comment(_nameUser("chengww"), _nameUser("产品"), "不不不，你的需求已经完成了~！"),
    ];

WeChatMomentsBean mockWeChatMoments() => WeChatMomentsBean(
    User("chengww", null, ""),
    "听说 Flutter 很🔥，我也来凑凑热闹，github 上面建了一个仓库，欢迎来撩✌🏻✌🏻✌🏻",
    ImageAttachment(
        "https://flutterchina.club/images/homepage/header-illustration.png"),
    "2小时前",
    _mockComments());

User _nameUser(String name) => User(name, null, null);
