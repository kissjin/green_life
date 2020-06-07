import 'dart:ffi';
import 'dart:io';
import 'dart:math';

// import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

import 'package:flutter/services.dart';
// import 'package:flutter_shop/page_index.dart';
// import 'package:flutter_app/bean/music.dart';

import 'package:palette_generator/palette_generator.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import './generate_utils.dart';
import '../global/config.dart';

class Utils {
  /// 获取运行平台是Android还是IOS
  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;

  /// 字符串转颜色
  ///
  /// [string] 字符串
  ///
  static Color strToColor(String string) {
    assert(string.length > 1);
    final int hash = string.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  /// 随机颜色
  ///
  static Color randomRGB() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }

  static Color randomARGB() {
    Random random = new Random();
    return Color.fromARGB(random.nextInt(180), random.nextInt(255),
        random.nextInt(255), random.nextInt(255));
  }

  /// 生成随机串
  ///
  /// [len] 字符串长度
  ///
  static String randomString(int len) {
    String character = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    String left = '';
    for (var i = 0; i < len; i++) {
      left = left + character[Random().nextInt(character.length)];
    }
    return left;
  }

  /// 屏幕宽
  ///
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  /// RPX 用于屏幕适配（比例适配）
  ///
  static double get rpx {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width / 750;
  }

  /// 屏幕高
  ///
  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  /// 标题栏高度（包括状态栏）
  ///
  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  /// 状态栏高度
  ///
  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }

  /// 底部状态栏高度
  ///
  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }

  static updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  /// 复制到剪粘板
  ///
  static copyToClipboard(String text) {
    if (text == null) return;
    Clipboard.setData(new ClipboardData(text: text));
  }

  static const RollupSize_Units = ["GB", "MB", "KB", "B"];

  /// 返回文件大小字符串
  ///
  static String getRollupSize(int size) {
    int idx = 3;
    int r1 = 0;
    String result = "";
    while (idx >= 0) {
      int s1 = size % 1024;
      size = size >> 10;
      if (size == 0 || idx == 0) {
        r1 = (r1 * 100) ~/ 1024;
        if (r1 > 0) {
          if (r1 >= 10)
            result = "$s1.$r1${RollupSize_Units[idx]}";
          else
            result = "$s1.0$r1${RollupSize_Units[idx]}";
        } else
          result = s1.toString() + RollupSize_Units[idx];
        break;
      }
      r1 = s1;
      idx--;
    }
    return result;
  }

  static Future<Color> getImageLightVibrantColor(String imagePath,
      {Color defaultColor: Colors.white30, String type: "network"}) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(type == "network"
            ? NetworkImage(imagePath)
            : AssetImage(imagePath));

    return paletteGenerator.lightVibrantColor?.color ?? defaultColor;
  }

  static Future<Color> getImageDominantColor(String imagePath,
      {Color defaultColor: Colors.blueAccent, String type: "network"}) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(type == "network"
            ? NetworkImage(imagePath)
            : AssetImage(imagePath));

    return paletteGenerator.dominantColor?.color ?? defaultColor;
  }

  static Future<Color> getImageDarkMutedColor(String imagePath,
      {Color defaultColor: Colors.blueAccent, String type: "network"}) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(type == "network"
            ? NetworkImage(imagePath)
            : AssetImage(imagePath));

    return paletteGenerator.darkMutedColor?.color ?? defaultColor;
  }

  static Future<Null> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //拼接url地址
  static sortUrl(data){
  var str = "";
  Map obj = sortObj(data);
  // List keys =data.keys.toList();

  // for (var i = 0; i < keys.length; i++) {
    // if(i>=keys.length-1){
    // str+=keys[i]+"="+obj[keys[i]];
    // }else{
    // str+=keys[i]+"="+obj[keys[i]]+'&';
    // }
  //   }
  obj.forEach((key,value){
      str+=key+"="+value+'&' ;
  });

  str += "secretKey=${Config.getKey()}";
  print('-----str-------');

  print(str);
  return generateSha256(str);
  }
  //对象的排序
  static sortObj(obj){
    List keys =obj.keys.toList();
    keys.sort();
    print(keys);
    Map newObj = {};
    for (var i = 0; i < keys.length; i++) {
      newObj[keys[i]] = obj[keys[i]];
    }
    return newObj;
  }

  /// 校验邮箱
  ///
  static bool isEmail(String email) {
    if (email == null) return false;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(
      pattern,
      caseSensitive: false,
      multiLine: false,
    );
    return regex.hasMatch(email);
  }
  ///大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
  /// 此方法中前三位格式有：
  /// 13+任意数 * 15+除4的任意数 * 18+除1和4的任意数 * 17+除9的任意数 * 147
  static bool isChinaPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }
  /// 校验金额
  ///
  static bool isAmount(String amount) {
    if (amount == null) return false;
    RegExp regex = RegExp(r'^\d+(\.\d+)?$');
    return regex.hasMatch(amount);
  }

  /// 校验密码
  ///
  bool validatePassword(String password) {
    if (password.length < 6 ||
        !password.contains(RegExp(r'[A-z]')) ||
        !password.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }

  /// 时间转字符串
  ///
  static String duration2String(Duration duration) {
    return duration?.toString()?.split('.')?.first ?? '0:00:00';
  }

  /// 16进制颜色值转换为10进制值
  ///
  /// [colorStr] 颜色值 #FFEE22
  /// [alpha] 透明度（16进制）
  ///
  static int getColorHexFromStr(String colorStr, {String alpha: "FF"}) {
    if (colorStr == null) {
      return 0;
    }
    colorStr = colorStr.replaceAll("#", "");
    if (colorStr.length == 6) {
      colorStr = alpha + colorStr;
    }
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
  //金额的转化
  //分转元
  static double centToYuan(int num){
    if(num==null){
      return 0;
    }
    return num/100;
  }

  //

  /// 隐藏键盘
  ///
  /// [context] 上下文
  ///
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// 状态栏状态
  ///
  /// [enable] true为显示；false为隐藏
  ///
  static void statusBarEnable(bool enable) {
    SystemChrome.setEnabledSystemUIOverlays(
        enable ? SystemUiOverlay.values : []);
  }

  /// 是否是空字符串
  ///
  static bool isEmptyString(String str) {
    if (str == null || str.isEmpty) {
      return true;
    }
    return false;
  }

  /// 是否不是空字符串
  ///
  static bool isNotEmptyString(String str) {
    if (str != null && str.isNotEmpty) {
      return true;
    }
    return false;
  }
  //是否是正确的Url
  static bool isUrl(String str){
    var URLRexExp = new RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
    if (str != null && URLRexExp.firstMatch(str)!=null) {
      return true;
    }
    return false;

  }

  /// 🔥格式化手机号为344
  ///
  static String formatMobile344(String mobile) {
    if (isEmptyString(mobile)) return '';
    mobile = mobile?.replaceAllMapped(new RegExp(r"(^\d{3}|\d{4}\B)"),
        (Match match) {
      return '${match.group(0)} ';
    });
    if (mobile != null && mobile.endsWith(' ')) {
      mobile = mobile.substring(0, mobile.length - 1);
    }
    return mobile;
  }
// //获取定位信息
//   static getLocationInfo()async{
//     if(Platform.isIOS){//
//         await AmapCore.init('d88999874ac3f47068a115d1c5af3335');
//       }
//    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);
//    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
//    ServiceStatus serviceStatus = await PermissionHandler().checkServiceStatus(PermissionGroup.location);
// // 单次定位
      

//      if(serviceStatus==ServiceStatus.enabled){
//        if (permission==PermissionStatus.granted) {

//          final location = await AmapLocation.fetchLocation();
//          print('取得定位权限');
//          SpUtil.setString("cityaddress", location.city);
//          SpUtil.setString("cityCode", location.adCode);
//          SpUtil.setDouble("latitude", location.latLng.latitude);//纬度
//          SpUtil.setDouble("longitude", location.latLng.longitude);//经度
//          print('cityCode=${location.adCode}');
//          print('location=${location.toString()}');
//          var proviceCode=SpUtil.getString('cityCode')==''?'310000':SpUtil.getString('cityCode').substring(0,2)+'0000';
//          SpUtil.setString("proviceCode", proviceCode);
//          print(location.cityCode);
//          print(location.latLng);
//          print(location.address);
//         print(MapUtil.bd_encrypt(121.29815,31.19147));


//        }else{


//        }

//      }else{

//      }
//  }

 //掉起电话api
 static usePhone(phone) async{
   String url = 'tel:' + phone;
  // String url='androidamap://keywordNavi?sourceApplication=softname&keyword=宛委山景区&style=2';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('不能访问');
  }

 }

}
