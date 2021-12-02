import 'package:clone_instagram/pages/chat_page.dart';
import 'package:clone_instagram/theme/colors.dart';
import 'package:clone_instagram/util/constant.dart';
import 'package:clone_instagram/util/new_feed_json.dart';
import 'package:clone_instagram/util/story_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  PreferredSize getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                width: 90,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ChatPage()));
                },
                icon: Icon(FontAwesome5Brands.facebook_messenger),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Row(
            children: List.generate(stories.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 80,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          stories[index]['isStory'] as bool
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient:
                                        LinearGradient(colors: bgStoryColors),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: bgWhite),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              stories[index]['imageUrl']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(width: 1, color: textGrey),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            stories[index]['imageUrl']
                                                .toString(),
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                          stories[index]['isAdd'] as bool
                              ? Positioned(
                                  right: 0,
                                  bottom: 0,
                                  height: 20,
                                  width: 20,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: primary),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: bgWhite,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        stories[index]['username'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Divider(),
        Column(
            children: List.generate(newFeeds.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: bgStoryColors),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.2),
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1, color: bgWhite),
                                  image: DecorationImage(
                                      image: NetworkImage(newFeeds[index]
                                              ['imageUrl']
                                          .toString()),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            newFeeds[0]['username'].toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(FontAwesome.ellipsis_v, size: 16)
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            newFeeds[index]['imageUrl'].toString()),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            splashRadius: 16,
                            onPressed: () {},
                            icon: newFeeds[index]['isLike'] as bool
                                ? SvgPicture.asset(
                                    "assets/images/heart.svg",
                                    width: 24,
                                    height: 24,
                                  )
                                : SvgPicture.asset(
                                    "assets/images/heart_red.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                          ),
                          IconButton(
                            splashRadius: 16,
                            onPressed: () {},
                            icon: Icon(
                              FontAwesome.comment_o,
                              size: 24,
                            ),
                          ),
                          IconButton(
                            splashRadius: 16,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/images/share.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Feather.bookmark))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${newFeeds[index]['likes']} likes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: newFeeds[index]['username'] as String,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: newFeeds[index]['caption'] as String,
                              style: TextStyle(height: 1.5)),
                        ]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        newFeeds[index]['comments'] as String,
                        style: TextStyle(color: bgGrey),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: (size.width - 32) * 0.7,
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(width: 1, color: bgGrey),
                                      image: DecorationImage(
                                          image: NetworkImage(profile),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 24,
                                  width: (size.width - 80) * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, left: 8, right: 8),
                                    child: TextField(
                                      cursorColor: textBlack.withOpacity(0.5),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Add a comment",
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  textBlack.withOpacity(0.5))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: (size.width - 32) * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("🥰"),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("😎"),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.add_circle_outline,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        newFeeds[index]['dateTime'] as String,
                        style: TextStyle(fontSize: 12, color: textGrey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        })),
      ],
    );
  }
}
