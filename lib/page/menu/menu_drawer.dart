import 'package:flutter/material.dart';
import 'package:flutter_OldManFriendly/core/utils/toast.dart';
import 'package:flutter_OldManFriendly/core/utils/xuifont.dart';
import 'package:flutter_OldManFriendly/generated/i18n.dart';
import 'package:flutter_OldManFriendly/page/home/tab_meishi.dart';
import 'package:flutter_OldManFriendly/page/home/user_profile.dart';
import 'package:flutter_OldManFriendly/page/menu/about.dart';
import 'package:flutter_OldManFriendly/page/menu/login.dart';
import 'package:flutter_OldManFriendly/page/menu/settings.dart';
import 'package:flutter_OldManFriendly/page/menu/sponsor.dart';
import 'package:flutter_OldManFriendly/utils/provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProfile, AppStatus>(builder: (BuildContext context,
        UserProfile value, AppStatus status, Widget child) {
      return Drawer(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                        child: Image.network(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffriendoprod.blob.core.windows.net%2Fmissionpics%2FEDM%2F20160711%2F0eeb98db-44a3-42c8-966e-d87248fb0b1b.jpg&refer=http%3A%2F%2Ffriendoprod.blob.core.windows.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1628915579&t=df0f37d6cce60edc183f9047290111d8",
                          width: 80,
                        ),
                        // FlutterLogo(
                        //   size: 80,
                        // ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      value.nickName != null
                          ? "admin" //value.nickName
                          : "admin", //I18n.of(context).title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ))
                  ],
                ),
              ),
              onTap: () {
                Get.to(() => UserProfilePage());
                //ToastUtils.toast("点击头像");
              },
            ),
            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: ListView(
                shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
                physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                scrollDirection: Axis.vertical, // 水平listView
                children: <Widget>[
                  //首页
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(I18n.of(context).home),
                    onTap: () {
                      status.tabIndex = TAB_HOME_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_HOME_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text(I18n.of(context).category),
                    onTap: () {
                      status.tabIndex = TAB_CATEGORY_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_CATEGORY_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.local_activity),
                    title: Text(I18n.of(context).activity),
                    onTap: () {
                      status.tabIndex = TAB_ACTIVITY_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_ACTIVITY_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(I18n.of(context).message),
                    onTap: () {
                      status.tabIndex = TAB_MESSAGE_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_PROFILE_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(I18n.of(context).profile),
                    onTap: () {
                      Get.to(() => UserProfilePage());
                      // status.tabIndex = TAB_PROFILE_INDEX;
                      //Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_PROFILE_INDEX,
                  ),
                  //设置、关于、其他
                  Divider(height: 1.0, color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text(I18n.of(context).camera),
                    onTap: () {
                      Get.to(() => TabMeiShiPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(I18n.of(context).settings),
                    onTap: () {
                      Get.to(() => SettingsPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.error_outline),
                    title: Text(I18n.of(context).about),
                    onTap: () {
                      Get.to(() => AboutPage());
                    },
                  ),
                  //退出
                  Divider(height: 1.0, color: Colors.grey),
                  ListTile(
                    leading: Icon(XUIIcons.logout),
                    title: Text(I18n.of(context).logout),
                    onTap: () {
                      value.nickName = "";
                      Get.offAll(() => LoginPage());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ));
    });
  }
}
