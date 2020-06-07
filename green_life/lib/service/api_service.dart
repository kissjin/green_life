import 'dart:convert';

import 'package:dio/dio.dart';
import './base_result.dart';
import '../page_index.dart';
import '../service/api_url.dart';
import '../utils/http_utils.dart';

class ApiService {
  static getPhoneMsg({String phone, String messageType}) async {
    Response response =
        await HttpUtils(baseUrl: ApiUrl.TESTBASE_URL).request(ApiUrl.GET_MSG,
            data: {
              "phone": phone,
              "messageType": messageType,
            },
            method: HttpUtils.POST);
    // if (response.statusCode != 200) {
    //   return null;
    // }
    return response;
  }
  //登录
  static login({String phone, String passWord, String checkCode}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.TESTBASE_URL).request(
        ApiUrl.Login,
        data: {"phone": phone, "passWord": passWord, "checkCode": checkCode},
        method: HttpUtils.POST);
    // if (response.statusCode != 200) {
    //   return null;
    // }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));
    return result;
  }

  //修改密码
  static ChangePassWord(
      {String phone, String passWord, String checkCode}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.TESTBASE_URL).request(
        ApiUrl.ChangePassWord,
        data: {"phone": phone, "passWord": passWord, "checkCode": checkCode},
        method: HttpUtils.POST);

    return BaseResult.fromMap(json.decode(response.data.body));
  }

  /// 增加推荐列表
  ///
  static Future addRecommend({String query,
  String name,String phone,String intentionModel,int vehicleId,
      int pagetIndex: 1, int pageSize: 20}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.TESTBASE_URL)
        .request(ApiUrl.AddRecommend, data: {
          "userId":SpUtil.getInt('userId'),
          "name":name,
          "phone":phone,
          "intentionModel":intentionModel,
          "vehicleId":vehicleId,
        }, method: HttpUtils.POST);
    if (response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));
    return result;
  }
//查询推荐列表
  static Future getRecommendList({
      int pagetIndex: 1,}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.TESTBASE_URL)
        .request(ApiUrl.GetRecommendList, data: {
          "userId":SpUtil.getInt('userId'),
          "page":{
            "pageIndex":pagetIndex,
            "pageSize":10,
          }
        }, method: HttpUtils.POST);
    if (response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));
    // RecommendsData data=RecommendsData.fromJson(json.decode(result.body));
    return result;
  }

  /// 上传企业证件
  ///
  /// [data] 数据
  ///
  static Future updateBusessPic(FormData data) async {
    Response response =
        await HttpUtils().uploadFile(ApiUrl.DoUpload, data: data);

    return response;

    // if (response != null &&
    //     response.statusCode >= 200 &&
    //     response.statusCode < 300) {
    //   BaseResult result = BaseResult.fromMap(response.data);

    //   if (result.code == '0') {
    //     return User.fromMap(result.data);
    //   } else {
    //     return null;
    //   }
    // } else {
    //   return null;
    // }
  }

  //修改用户信息
  static changeUserInfo(int userId, {String name, String headUrl}) async {
    Map<String, dynamic> map = {'userId': userId};
    if (name?.isNotEmpty == true) {
      map['name'] = name;
    }
    if (headUrl?.isNotEmpty == true) {
      map['headUrl'] = headUrl;
    }
    Response response = await HttpUtils(baseUrl: ApiUrl.TESTBASE_URL)
        .request(ApiUrl.ChangeUserInfo, data: map, method: HttpUtils.POST);
    return BaseResult.fromMap(json.decode(response.data));
  }

  //查询用户信息
  // static Future<UserInfoModel> getUserInfo({
  //   Function(ErrorModel error) errorCallBack,
  //   Function(UserInfoModel model) successCallback,
  // }) async {
  //   await HttpUtils(baseUrl: ApiUrl.TESTBASE_URL).requestNet(
  //       ApiUrl.QueryUserInfo,
  //       data: {'userId': SpUtil.getInt('userId')},
  //       method: HttpUtils.POST,
  //       errorCallBack: errorCallBack, successCallBack: (result) {
  //     successCallback(UserInfoModel.fromJson(json.decode(result.body)));
  //   });
  // }

  
  
}
