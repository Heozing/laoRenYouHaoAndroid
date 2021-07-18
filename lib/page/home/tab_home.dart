import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_OldManFriendly/page/home/tab_activity.dart';
import 'package:flutter_OldManFriendly/page/home/tab_chart.dart';
import 'package:flutter_OldManFriendly/page/home/tab_emotion.dart';
import 'package:flutter_OldManFriendly/page/home/tab_fall.dart';
import 'package:flutter_OldManFriendly/page/home/tab_fence.dart';
import 'package:flutter_OldManFriendly/page/home/user_profile.dart';
import 'package:flutter_OldManFriendly/page/menu/about.dart';
import 'package:flutter_OldManFriendly/page/menu/settings.dart';
import 'package:flutter_OldManFriendly/router/router.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_OldManFriendly/core/utils/toast.dart';
import 'package:flutter_OldManFriendly/core/widget/grid/grid_item.dart';
import 'package:flutter_OldManFriendly/core/widget/list/article_item.dart';
import 'package:flutter_OldManFriendly/page/home/tab_meishi.dart';
import 'package:flutter_OldManFriendly/page/menu/register.dart';
import 'package:get/get.dart';

class TabHomePage extends StatefulWidget {
  @override
  _TabHomePageState createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  int _count = 5;

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: MaterialHeader(),
      footer: MaterialFooter(),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _count = 5;
          });
        });
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _count += 5;
          });
        });
      },
      slivers: <Widget>[
        //=====轮播图=====//
        SliverToBoxAdapter(child: getBannerWidget()),

        //=====网格菜单=====//
        SliverPadding(
            padding: EdgeInsets.only(top: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  var action = actions[index];
                  return GridItem(
                      title: action.title.substring(0, 2),
                      color: action.color,
                      onTap: () {
                        if (index == 0) {
                          Get.to(() => TabMeiShiPage());
                        } else if (index == 1) {
                          Get.to(() => tabFallPage());
                        } else if (index == 4) {
                          Get.to(() => tabEmotion());
                        } else if (index == 2) {
                          Get.to(() => tabActivity());
                        } else if (index == 3) {
                          Get.to(() => tabFence());
                        } else if (index == 5) {
                          Get.to(() => tabChart());
                        } else if (index == 6) {
                          Get.to(() => SettingsPage());
                        } else if (index == 7) {
                          Get.to(() => UserProfilePage());
                        }
                        //ToastUtils.toast('点击-->${action.title}');
                      });
                },
                childCount: actions.length,
              ),
            )),

        SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Text(
                  '资讯',
                  style: TextStyle(fontSize: 18),
                ))),

        //=====列表=====//
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              ArticleInfo info = articles[index % 5];
              return ArticleListItem(
                  articleUrl: info.articleUrl,
                  imageUrl: info.imageUrl,
                  title: info.title,
                  author: info.author,
                  description: info.description,
                  summary: info.summary);
            },
            childCount: _count,
          ),
        ),
      ],
    );
  }

  //这里是演示，所以写死
  final List<String> urls = [
    "assets/oldMan.jpg",
    "assets/oldMan2.jpeg",
    "assets/oldMan3.jpeg",
    //"https://static01.nyt.com/images/2013/07/03/world/asia/03beijing/03beijing-master1050.jpg",
    //"http://5b0988e595225.cdn.sohucs.com/images/20191012/58d890085a2f4facbbc1783cde5d3a73.jpeg",
    //"http://5b0988e595225.cdn.sohucs.com/images/20191012/58d890085a2f4facbbc1783cde5d3a73.jpeg",
    //"http://pics2.baidu.com/feed/902397dda144ad3491169c550148aaf233ad85ac.jpeg?token=9227c31830c90dceffea904275ca1c3a",

    //"https://wallpaperm.cmcm.com/9fe729d6e524eb54caa2390a5100a980.jpg", //伪装者:胡歌演绎"痞子特工"
    // "http://photocdn.sohu.com/tvmobilemvms/20150907/144158380433341332.jpg", //无心法师:生死离别!月牙遭虐杀
    // "http://photocdn.sohu.com/tvmobilemvms/20150907/144160286644953923.jpg", //花千骨:尊上沦为花千骨
    // "http://photocdn.sohu.com/tvmobilemvms/20150902/144115156939164801.jpg", //综艺饭:胖轩偷看夏天洗澡掀波澜
    // "http://photocdn.sohu.com/tvmobilemvms/20150907/144159406950245847.jpg", //碟中谍4:阿汤哥高塔命悬一线,超越不可能
  ];

  Widget getBannerWidget() {
    return SizedBox(
      height: 300,
      child: Swiper(
        autoplay: true,
        duration: 2000,
        autoplayDelay: 5000,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(urls[index]),
                  //     CachedNetworkImageProvider(
                  //   urls[index],
                  // ),
                )),
          );
        },
        onTap: (value) {
          String title;
          String url;
          if (value == 0) {
            title = "我们去哪里养老";
            url =
                "https://cn.nytimes.com/real-estate/20130902/cc02elderly/zh-hant/";
            XRouter.goWeb(url, title);
          } else if (value == 1) {
            title = "空巢老人”的养老困境";
            //url = "http://192.168.43.214:8001/#/function-charts";
            url = "https://www.sohu.com/a/346455665_495449";
            XRouter.goWeb(url, title);
          } else if (value == 2) {
            title = "黄昏老年网";
            url = "http://www.huanghun.com/";
            XRouter.goWeb(url, title);
          }
          // ToastUtils.toast("点击--->" + value.toString());
        },
        itemCount: urls.length,
        pagination: SwiperPagination(),
      ),
    );
  }

  //这里是演示，所以写死
  final List<ActionItem> actions = [
    ActionItem('主摄像头检测', Colors.grey[200]),
    ActionItem('跌倒检测', Colors.grey[200]),
    ActionItem('义工交互检测', Colors.grey[200]),
    ActionItem('禁止区域检测', Colors.grey[200]),
    ActionItem('表情识别', Colors.grey[200]),
    ActionItem('图表', Colors.grey[200]),
    ActionItem('设置', Colors.grey[200]),
    ActionItem('我的', Colors.grey[200]),
  ];

  //这里是演示，所以写死
  final List<ArticleInfo> articles = [
    ArticleInfo(
      'https://baijiahao.baidu.com/s?id=1668000034057213142&wfr=spider&for=pc',
      // 'https://user-gold-cdn.xitu.io/2019/1/16/1685563ae5456408?imageView2/0/w/1280/h/960/format/webp/ignore-error/1',
      'https://pics4.baidu.com/feed/8d5494eef01f3a294b15534c584f00375e607cc0.jpeg?token=2d706ce9f820bdc55ea54b4099c36d66',
      '全国老龄办：在常态化疫情防控中做好老年人照顾服务工作',
      '党中央国务院高度重视老年人照顾服务工作。当前，在常态化疫情防控中，广大老年人特别是独居、高龄、失能等特殊困难老年人，在生活、就医、照护、心理健康等方面面临一系列实际困难和问题。为深入贯彻落实党中央关于抓紧抓实抓细常态化疫情防控工作的决策部署，按照《国务院应对新型冠状病毒感染肺炎疫情联防联控机制关于做好新冠肺炎疫情常态化防控工作的指导意见》要求，全国老龄办印发《通知》，对做好常态化疫情防控中的老年人照顾服务工作作出部署。',

      '健康中国',
      '国家卫生健康委员会',
    ),
    ArticleInfo(
      'https://post.smzdm.com/p/ammk842z/',
      'https://qna.smzdm.com/202005/13/5ebbc2b4758b72213.jpg_fo742.jpg',
      '5大热门养老社区对比，哪个更好？',
      '最近测评过几款有养老社区的年金险，引起了大家的兴趣；很多朋友也在后台问我，这么多养老社区对比起来哪间比较好，入住条件和价格如何；之前主要是针对产品来测评，那今天就写写养老社区的事儿：',
      '王伟安',
      '什么值得买',
    ),
    ArticleInfo(
      'https://www.cpic.com.cn/market/c/2019-03-20/1571488.shtml?subOtherSource=ZNTJ&utm_medium=ZNTJ',
      'https://www.cpic.com.cn/market/upload/resources/image/2019/05/22/50279.png',
      '悦享保”个人癌症医疗保障计划v',
      '本产品三高人群和慢性病人群能买吗？答：高血压、高血脂、糖尿病等慢性病人群均可购买。您需要在投保时如实进行健康告知，如果您未如实告知，有可能不能获得理赔。2、本产品主要针对哪些人群的？答：本产品是为45周岁-80周岁的中老年人定制的。续保可至100周岁。',
      '养老保险',
      '太平洋保险',
    ),
    ArticleInfo(
      'https://tisi.org/4647',
      'http://www.spcsc.sh.cn/images/thumbnailimg/month_1810/201810171023569845.jpg',
      '未来你将这样养老：看智慧养老如何破解人口老龄化？',
      '随着中国跑步进入老年化社会，如何养老已成为不得不面对的严峻问题。在5月27日中共中央政治局就我国人口老龄化的形势和对策举行的集体学习会上，习近平总书记强调：要努力挖掘人口老龄化给国家发展带来的活力和机遇，努力满足老年人日益增长的物质文化需求，推动老龄事业全面协调可持续发展。在满足老年人的文化需求方面，以互联网和大数据为支持的智慧养老能发挥哪些作用？在应用过程中又会产生哪些问题?老百姓对此的接受度如何?能否激活老龄化所带来的活力和机遇?腾讯研究院联合同济大学课题组曾对此展开了调研。',
      'lilian',
      '腾讯研究院',
    ),
    ArticleInfo(
      'https://bg.qianzhan.com/trends/detail/506/200527-39d0ade1.html',
      'http://www.spcsc.sh.cn/images/thumbnailimg/month_1810/201810171024146415.jpg',
      '2020年中国智慧养老产业市场现状及发展趋势分析 智能硬件+智能平台创新化发展',
      '随着老年化的加重和“银发经济”的兴起，国家大力支持养老行业的背景下，智能养老行业迎来发展的良好时期。目前我国养老主要我国的养老行业以居家为基础，社区为依托，机构为支撑，三种模式相辅相成，互相影响。未来智慧养老将在智能硬件和智能平台的协助下，由“助老”向“用老”和“孝老”迸发。',
      '匿名',
      '前瞻产业研究院',
    ),
  ];
}
