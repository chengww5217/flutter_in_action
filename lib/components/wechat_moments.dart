import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_action/bean/pets_card_bean.dart';
import 'package:flutter_in_action/bean/wechat_moments_bean.dart';

class WeChatMoments extends StatefulWidget {
  final WeChatMomentsBean bean;

  WeChatMoments(this.bean);

  @override
  State<StatefulWidget> createState() {
    return _WeChatMomentsState();
  }
}

class _WeChatMomentsState extends State<WeChatMoments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Build user info
          buildAvatar(),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.bean.user.name,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                Text(
                  widget.bean.post,
                  softWrap: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: FadeInImage.assetNetwork(
                    placeholder: "images/svg/avatar_default.svg",
                    image: (widget.bean.attachment as ImageAttachment)?.url,
                    // Just for a demo
                    width: double.infinity,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.bean.time,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Icon(
                          Icons.comment_sharp,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  color: Color(0x9fdddddd),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.bean.comments
                        .map((comment) => _buildComment(comment))
                        .toList(growable: false),
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  ClipRRect buildAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage.assetNetwork(
        placeholder: "images/svg/avatar_default.svg",
        image:
            "https://avatars.githubusercontent.com/u/34536334?s=460&u=68735267f76ff3e1ffee9f8ebc52e717499e5b3a&v=4",
        width: 52,
        height: 52,
      ),
    );
  }

  Widget _buildComment(Comment comment) {
    List<InlineSpan> commentChildSpan = [_commentUserTextSpan(comment.user)];
    if (comment.replayTo != null) {
      commentChildSpan.add(TextSpan(text: " 回复 "));
      commentChildSpan.add(_commentUserTextSpan(comment.replayTo));
    }
    commentChildSpan.add(TextSpan(text: ": ${comment.content}"));

    return RichText(
        softWrap: true,
        text: TextSpan(
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, .66), fontSize: 14),
            children: commentChildSpan));
  }

  TextSpan _commentUserTextSpan(User user) => TextSpan(
      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600),
      text: user.name,
      recognizer: TapGestureRecognizer()..onTap = () => print(user.toString()));
}
