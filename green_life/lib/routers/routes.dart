import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'router_handler.dart';



class Routes{
//   /// 路由表
// final Map<String, WidgetBuilder> routeTable = {
//   '/' : (content) => Home(),
//   '/page1' : (content) => Page1(),
//   '/page2' : (content) => Page2(),
//   '/page3' : (content) => Page3(),
// };

  static String root = '/';
  static String detailsPage = '/detail';//商品详情
  static String buyNewCarPage = '/buyNewCar';//买新车
  static String addVehicleInsurance = '/addVehicleInsurance';//车保续险
  static String subscribeMaintenance = '/subscribeMaintenance';//维保预约
  static String myRecommend = '/myRecommend';//推荐有礼
  static String marketPage = '/marketPage';//特惠商城

  static void configureRoutes(Router router){

    router.notFoundHandler =  new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('error::: router 没有找到');
        // return NoFindPage();
      }
    );

    router.define(detailsPage, handler: detailsHandler);
  }

  void pushNewPage(BuildContext context, Widget routePage,
      {Function callBack, fullscreenDialog: false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => routePage,
            fullscreenDialog: fullscreenDialog))
        .then((value) {
      if (value != null) {
        callBack(value);
      }
    });
  }

}
