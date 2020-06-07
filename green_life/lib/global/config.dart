import 'dart:io';
class Config {
  static final bool DEBUG = true;

  /// 高德地图APP_KEY
  static final String AMAP_KEY = "24d68b20bd23ec522658ddd98d3cd5b0";

  /// 和天气APP_KEY
  static final String HE_WEATHER_KEY =
      // '2d2a76fac8324146a1b17b68bda42c76';
      "d6cfdce8193445ba894d889e7ab2de5b";
  static getAppId() {
    return Platform.isAndroid ? '201832602990318430' : '201832602990318430';
  }
  static getKey(){
    return Platform.isAndroid ? 'R90QEMELGXCOVIQ9EF0GQBY4UJVR78ZXIRPVWUDALYVKVVFMBPMSXSO361N5QOZP'
        :'R90QEMELGXCOVIQ9EF0GQBY4UJVR78ZXIRPVWUDALYVKVVFMBPMSXSO361N5QOZP';
  }

  static final String READER_IMAGE_URL = 'http://statics.zhuishushenqi.com';
  static final String READER_CHAPTER_URL =
      'http://chapterup.zhuishushenqi.com/chapter/';
}
