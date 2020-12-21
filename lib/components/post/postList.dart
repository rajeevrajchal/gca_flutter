import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week_1/components/index.dart';
import 'package:week_1/models/fb_post.dart';
import 'package:week_1/styles/palette.dart';
import 'package:week_1/styles/vars.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<FB_POST> listData = [];
  bool isLoading = false;
  Future<String> loadPostFromAssets() async {
    return await rootBundle.loadString('assets/data/fb_data.json');
  }

  Future loadPost() async {
    setState(() {
      isLoading = true;
    });
    String jsonString = await loadPostFromAssets();
    setState(() {
      listData = FB_POST.getPost(jsonString);
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    return isLoading ? LinearProgressIndicator(
      backgroundColor: Palette.light,
      minHeight: Vars.sm,
    ):Container(
      // padding: EdgeInsets.all(Vars.sm),
      child: ListView.separated(
        // padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(post: listData[index]);
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: Vars.md),
      ),
    );
  }

}
