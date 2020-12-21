import 'package:flutter/material.dart';
import 'package:week_1/models/fb_post.dart';
import 'package:week_1/styles/palette.dart';
import 'package:week_1/styles/vars.dart';

class PostCard extends StatelessWidget {
  final FB_POST post;

  const PostCard({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          {Navigator.of(context).pushNamed('/detail', arguments: post)},
      child: Container(
          decoration: BoxDecoration(
            color: Palette.light,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(Vars.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _postHeader(),
              Container(
                padding: EdgeInsets.all(Vars.md),
                margin: EdgeInsets.only(top: Vars.md),
                child: Column(
                  children: [
                    _userPostDescription(),
                    SizedBox(
                      height: Vars.md,
                    ),
                    Container(
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2020/01/11/14/36/winter-4757707__480.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: Vars.md,
                    ),
                    _postCounter(),
                    SizedBox(
                      height: Vars.md,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    _postComment()
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _postHeader() {
    return Container(
      padding: EdgeInsets.only(left: Vars.md, right: Vars.md, top: Vars.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _userAvatar(),
                SizedBox(
                  width: Vars.md,
                ),
                _userInfo()
              ],
            ),
          ),
          Container(
            child: Text(
              '...',
              style: TextStyle(fontSize: Font.lg, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _userAvatar() {
    return Container(
      padding: EdgeInsets.all(Vars.sm),
      decoration: BoxDecoration(color: Palette.dark, shape: BoxShape.circle),
      child: Image.network(
        post.avatar,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _userInfo() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            post.user_name,
            style: TextStyle(fontSize: Font.md, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3.0,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.green,
                size: Font.md,
              ),
              Container(
                margin: EdgeInsets.only(left: Vars.sm),
                child: Text(
                  "Online",
                  style: TextStyle(fontSize: Font.md),
                ),
              )
            ],
          )
        ]);
  }

  Widget _userPostDescription() {
    return RichText(
      text: TextSpan(
        text:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.',
        style: TextStyle(color: Colors.black, fontSize: 18),
        children: <TextSpan>[
          TextSpan(
              text: 'Where does it come from?',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Palette.primary)),
        ],
      ),
    );
  }

  Widget _postComment() {
    return Container(
        padding: EdgeInsets.only(top: Vars.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _postIcon(
                Icon(
                  Icons.thumb_up,
                  color: Palette.dark,
                  size: Font.lg,
                ),
                "Like"),
            _postIcon(
                Icon(
                  Icons.comment,
                  color: Palette.dark,
                  size: Font.lg,
                ),
                "Comment"),
            _postIcon(
                Icon(
                  Icons.share,
                  color: Palette.dark,
                  size: Font.lg,
                ),
                "Share")
          ],
        ));
  }

  Widget _postIcon(Icon icon, String label) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: Vars.sm,
        ),
        Text(
          label,
          style: TextStyle(fontSize: Font.md),
        )
      ],
    );
  }

  Widget _postCounter() {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _postLiked(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text((post.comments / 1000).toStringAsFixed(1) + "K" + " Comments"),
            SizedBox(
              width: Vars.sm,
            ),
            Text((post.shares / 1000).toStringAsFixed(1) + "K" + " Shares")
          ],
        )
      ],
    ));
  }

  Widget _postLiked() {
    return Container(
      child: Row(
        children: [
          Container(
            decoration:
                BoxDecoration(color: Palette.primary, shape: BoxShape.circle),
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.thumb_up,
              color: Palette.light,
              size: Font.md,
            ),
          ),
          Container(
            decoration:
                BoxDecoration(color: Palette.fav, shape: BoxShape.circle),
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.favorite,
              color: Palette.light,
              size: Font.md,
            ),
          ),
          SizedBox(
            width: Vars.sm,
          ),
          Text((post.likes / 1000).toStringAsFixed(1) + "K")
        ],
      ),
    );
  }
}
