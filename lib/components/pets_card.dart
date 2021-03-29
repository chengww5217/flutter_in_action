import 'package:flutter/material.dart';
import 'package:flutter_in_action/bean/pets_card_bean.dart';

import 'icon_text_button.dart';
import 'loading_image.dart';

class PetsCard extends StatefulWidget {
  final PetsCardBean card;

  PetsCard(this.card);

  @override
  State<StatefulWidget> createState() {
    return _PetsCardState();
  }
}

class _PetsCardState extends State<PetsCard> {
  bool _userClickedFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      margin: EdgeInsets.fromLTRB(18, 16, 18, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCover(),
          buildUserInfo(),
          buildTag(),
          buildPost(),
          buildBottom()
        ],
      ),
    );
  }

  ClipRRect buildCover() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: loadingImage(widget.card.coverUrl),
    );
  }

  Padding buildUserInfo() {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            foregroundImage: NetworkImage(widget.card?.user?.avatar),
            backgroundColor: Colors.grey,
          ),
          Expanded(
            child: Container(
                height: 40,
                padding: EdgeInsets.fromLTRB(12, 1.5, 12, 1.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.card?.user?.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      widget.card?.user?.info,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(widget.card?.postTime,
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Container buildTag() {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18),
      padding: EdgeInsets.fromLTRB(10, 2, 10, 3),
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Text(
        "# ${widget.card.tag}",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Container buildPost() {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
      child: SelectableText(
        widget.card.post,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Padding buildBottom() {
    Color color = _userClickedFavorite ? Colors.amber : Colors.grey;
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconTextButton(
              Icons.comment_sharp, widget.card.comments.toString(), () {}),
          IconTextButton(Icons.favorite, widget.card.likes.toString(), () {
            setState(() {
              _userClickedFavorite ? widget.card.likes-- : widget.card.likes++;
              _userClickedFavorite = !_userClickedFavorite;
            });
          }, color: color),
          IconTextButton(Icons.share, widget.card.shares.toString(), () {}),
        ],
      ),
    );
  }
}
