import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../page_index.dart';
class SubExpandBean {
  String title;
  Widget page;

  SubExpandBean(this.title, this.page);
}

List<String> bannerImages = [
  "http://img1.homekoocdn.com/huxing_fangan/images/taocan_pic_1024/850/2014_06_16/542_fb71b7c3cfc2be7b26dfcf44f7afd041.jpg",
  'http://img1.homekoocdn.com/huxing_fangan/images/taocan_pic_1024/849/2014_06_13/542_972bf1d8298dadde168679ad49153a22.jpg',
  'http://img1.homekoocdn.com/huxing_fangan/images2018/2018_12/1_1111.jpg',
  'http://img1.homekoocdn.com/huxing_fangan/images2018/2018_11/99993.jpg',
];

var backgroundImage =
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=207405038,2990742581&fm=26&gp=0.jpg';

var douBanDefaultImage =
    "https://img1.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png";

String weatherBg(String condCode) {
  String bgImage = '';
  switch (condCode) {
    case '100':
    case '200':
    case '201':
    case '202':
    case '203':
    case '204':
    case '205':
    case '206':
    case '207':
    case '208':
    case '209':
    case '210':
    case '211':
    case '212':
    case '213':
    case '999':
      bgImage = 'images/weather_backgrounds/back_100d.jpg';
      break;
    case '101':
    case '102':
    case '103':
      bgImage = 'images/weather_backgrounds/back_101d.jpg';
      break;
    case '104':
      bgImage = 'images/weather_backgrounds/back_104d.jpg';
      break;
    case '300':
    case '301':
    case '305':
    case '306':
    case '307':
    case '308':
    case '309':
    case '310':
    case '311':
    case '312':
    case '313':
    case '314':
    case '315':
    case '316':
    case '317':
    case '318':
    case '399':
      bgImage = 'images/weather_backgrounds/back_300d.jpg';
      break;
    case '302':
    case '303':
    case '304':
      bgImage = 'images/weather_backgrounds/back_302d.jpg';
      break;
    case '400':
    case '401':
    case '402':
    case '403':
    case '404':
    case '405':
    case '406':
    case '407':
    case '408':
    case '409':
    case '410':
    case '499':
      bgImage = 'images/weather_backgrounds/back_400d.jpg';
      break;
    case '500':
    case '501':
    case '509':
    case '510':
    case '514':
    case '515':
      bgImage = 'images/weather_backgrounds/back_500d.jpg';
      break;
    case '502':
    case '511':
    case '512':
    case '513':
      bgImage = 'images/weather_backgrounds/back_502d.jpg';
      break;
    case '503':
    case '504':
    case '507':
    case '508':
      bgImage = 'images/weather_backgrounds/back_503d.jpg';
      break;
    case '900':
      bgImage = 'images/weather_backgrounds/back_900d.jpg';
      break;
    case '901':
      bgImage = 'images/weather_backgrounds/back_901d.jpg';
      break;
    default:
      bgImage = 'images/weather_backgrounds/back_100d.jpg';
      break;
  }
  return bgImage;
}

const List<String> QDailyKeys = <String>[
  "好莱坞",
  "亚马逊",
  "阿里巴巴",
  "音乐节",
  "特斯拉",
  "腾讯",
  "苹果",
  "海淘",
  "百度",
  "Google",
  "小米",
  "时尚",
  "迪士尼",
  "万达",
  "星巴克",
  "人工智能",
  "无人机",
  "华为",
  "MUJI",
  "宜家"
];

List<String> guideList = [
  "images/qdaily/bg_whatsnew_bg_1.jpg",
  "images/qdaily/bg_whatsnew_bg_2.jpg",
  "images/qdaily/bg_whatsnew_bg_3.jpg"
];
/// 类型
const GenreList = [
  '剧情',
  '喜剧',
  '动作',
  '爱情',
  '科幻',
  '动画',
  '纪录片',
  '悬疑',
  '惊悚',
  '恐怖',
  '犯罪',
  '奇幻',
  '冒险',
  '灾难',
  '武侠',
  '音乐',
  '歌舞',
  '传记',
  '历史',
  '战争',
  '同性',
  '西部',
  '情色'
];

/// 地区
const RegionList = [
  '中国大陆',
  '美国',
  '香港',
  '日本',
  '韩国',
  '台湾',
  '英国',
  '法国',
  '德国',
  '意大利',
  '西班牙',
  '印度',
  '泰国',
  '俄罗斯',
  '伊朗',
  '加拿大',
  '澳大利亚',
  '爱尔兰',
  '瑞典',
  '巴西',
  '丹麦'
];

/// 特色
const FeatureList = [
  '经典',
  '青春',
  '治愈',
  '文艺',
  '女性',
  '小说改编',
  '超级英雄',
  '美食',
  '宗教',
  '励志',
  '魔幻',
  '黑帮',
  '感人'
];

/// 年代
const YearList = [
  '2019',
  '2018',
  '2010年代',
  '2000年代',
  '90年代',
  '80年代',
  '70年代',
  '60年代',
  '更早'
];

/// 所有主题色列表
final List<Color> themeColors = [
  Colors.blue,
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.deepOrange,
  Colors.pink,
  Colors.purple,
  Colors.amber,
  Colors.teal,
  Colors.lightGreen,
  Colors.grey,
];

List<Map<String, dynamic>> orderTitles = [
  {'icon': Icons.all_inclusive, 'title': '全部'},
  {'icon': CustomIcon.no_payment, 'title': '待付款'},
  {'icon': CustomIcon.no_send, 'title': '待发货'},
  {'icon': CustomIcon.no_receive, 'title': '待收货'},
  {'icon': CustomIcon.comment, 'title': '待评价'}
];

/// 枚举: 支持的语言种类
enum SupportLocale {
  FOLLOW_SYSTEM,
  SIMPLIFIED_CHINESE,
  TRADITIONAL_CHINESE_TW,
  TRADITIONAL_CHINESE_HK,
  ENGLISH
}

/// SupportLocale -> locale
Map<SupportLocale, Locale> mapLocales = {
  SupportLocale.FOLLOW_SYSTEM: null,
  SupportLocale.SIMPLIFIED_CHINESE: Locale("zh", "CN"),
  SupportLocale.TRADITIONAL_CHINESE_TW: Locale("zh", "TW"),
  SupportLocale.TRADITIONAL_CHINESE_HK: Locale("zh", "HK"),
  SupportLocale.ENGLISH: Locale("en", "")
};

/// SupportLocale 对应的含义
Map<SupportLocale, String> get mapSupportLocale =>
    {
      SupportLocale.FOLLOW_SYSTEM: "跟随系统",
      SupportLocale.SIMPLIFIED_CHINESE: "简体中文",
      SupportLocale.TRADITIONAL_CHINESE_TW: "繁體中文(臺灣)",
      SupportLocale.TRADITIONAL_CHINESE_HK: "繁體中文(香港)",
      SupportLocale.ENGLISH: "English"
    };
