import 'package:flutter/material.dart';
import 'package:week_1/models/fb_post.dart';
import 'package:week_1/styles/palette.dart';
import 'package:week_1/styles/vars.dart';
import 'package:week_1/widgets/index.dart';

class PostDetail extends StatelessWidget {
  final FB_POST post;

  const PostDetail({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.light,
      appBar: customAppBar(post.user_name),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userPostDescription(),
          SizedBox(
            height: Vars.md,
          ),
          _postImage(),
          SizedBox(
            height: Vars.md,
          ),
          Divider(
            color: Colors.black,
          ),
          _postComment(),
          SizedBox(
            height: Vars.md,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: Vars.md,
          ),
          _commentList(height)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Palette.dark,
        backgroundColor: Palette.primary,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Palette.light,
          size: Font.lg,
        ),
      ),
    );
  }

  Widget _userPostDescription() {
    return Container(
      padding: EdgeInsets.all(Vars.md),
      child: RichText(
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
      ),
    );
  }

  Widget _postImage() {
    return Container(
      padding: EdgeInsets.only(left: Vars.md,right: Vars.md),
      child: Image.network(
        "https://cdn.pixabay.com/photo/2020/01/11/14/36/winter-4757707__480.jpg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _postComment() {
    return Container(
        padding: EdgeInsets.only(left: Vars.md,right: Vars.md, top: Vars.md),
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
                  Icons.bookmark,
                  color: Palette.dark,
                  size: Font.lg,
                ),
                "Bookmark"),
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

  Widget _commentList(double height) {
    return post.comments != 0
        ? _commentCard(height)
        : Text(
            'No comments',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          );
  }

  Widget _commentCard(double height) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(left: Vars.md, right: Vars.md),
        scrollDirection: Axis.vertical,
        itemCount: post.comments,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: height * .07,
            padding: EdgeInsets.only(left: Vars.md, right: Vars.md),
            decoration: BoxDecoration(
              color: Palette.light,
              borderRadius: BorderRadius.all(Radius.circular(Vars.md)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: Vars.md),
      ),
    );
  }
}
