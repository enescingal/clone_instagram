import 'package:clone_instagram/pages/account_page.dart';
import 'package:clone_instagram/pages/activity_page.dart';
import 'package:clone_instagram/pages/home_page.dart';
import 'package:clone_instagram/pages/new_post_page.dart';
import 'package:clone_instagram/pages/search_page.dart';
import 'package:clone_instagram/theme/colors.dart';
import 'package:clone_instagram/util/bottom_navigation_bar_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNavigatorBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: indexPage,
      children: [
        HomePage(),
        SearchPage(),
        NewPostPage(),
        ActivityPage(),
        AccountPage(),
      ],
    );
  }

  Widget getBottomNavigatorBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: bgLightGrey,
        border:
            Border(top: BorderSide(width: 1, color: bgDark.withOpacity(0.3))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(icons.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  indexPage = index;
                });
              },
              icon: SvgPicture.asset(
                indexPage == index
                    ? icons[index]['active']!
                    : icons[index]['inactive']!,
                width: 25,
                height: 25,
              ),
            );
          }),
        ),
      ),
    );
  }
}
