// import 'package:date_format/date_format.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../page_index.dart';
// class GreenStewardPage extends StatefulWidget {

//   const GreenStewardPage({Key key,}) : super(key: key);
//   @override
//   _GreenStewardPageState createState() => _GreenStewardPageState();
// }

// class _GreenStewardPageState extends State<GreenStewardPage> {

//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return LightTheme(
//        child: Scaffold(
//       backgroundColor: Colors.white,
//       body: Text('data')
//     )
//     );
//   }
// }
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:green_life/page_index.dart';
import 'package:green_life/pages/components/company_page.dart';
import '../utils/misc.dart';
import '../utils/next_latlng.dart';
import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_life/pages/components/data_analysis_page.dart';
import '../page_index.dart';

final _networkIcon = Uri.parse(
    'https://w3.hoopchina.com.cn/30/a7/6a/30a76aea75aef69e4ea0e7d3dee552c7001.jpg');
final _assetsIcon1 = Uri.parse('assets/fonts/images/icon01_black@2x.png');
final _assetsIcon2 = Uri.parse('assets/fonts/images/icon02_green@2x.png');

class DrawPointScreen extends StatefulWidget {
  DrawPointScreen();

  @override
  DrawPointScreenState createState() => DrawPointScreenState();
}

class DrawPointScreenState extends State<DrawPointScreen> with NextLatLng {
  AmapController _controller;
  List<Marker> _markers = [];
  Marker _hiddenMarker;
  SmoothMoveMarker _moveMarker;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  List<CompanyType> dataList = [
    CompanyType(tilte: '上海环保公司', id: 1,address: "翔黄路198号智尚园区6-15",type: 0),
    CompanyType(tilte: '海德里会展商', id: 2,address: "星华公路2228号", type: 1),
    CompanyType(tilte: '上海杨阳金属', id: 3,address: "静唐路335号-15", type: 2),
    CompanyType(tilte: '上海杨阳金属', id: 3,address: "静唐路335号-15", type: 2),
    CompanyType(tilte: '上海杨阳金属', id: 3,address: "静唐路335号-15", type: 2),
    CompanyType(tilte: '上海杨阳金属', id: 3,address: "静唐路335号-15", type: 2),
  ];
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i].type == 1) {
      } else if (dataList[i].type == 2) {
      } else if (dataList[i].type == 3) {}
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('环保管家'),backgroundColor:Colors.,actions: <Widget>[
      //   Text('data')
      // ],),
      body: DecoratedColumn(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Stack(
              children: <Widget>[
                AmapView(
                  zoomLevel: 6,
//                  markers: [
//                    MarkerOption(
//                      latLng: getNextLatLng(),
//                  iconUri: _assetsIcon1,
// //                  imageConfig: createLocalImageConfiguration(context),
//                    ),
//                  ],
                  onMapCreated: (controller) async {
                    _controller = controller;
                    if (await requestPermission()) {
                      await controller.setZoomLevel(8);
                    }
                    _controller?.addMarkers(
                      [
                        for (int i = 0; i < dataList.length; i++)
                          //                   if(dataList[i].type==1){

                          // }else if(dataList[i].type==2){

                          // }else if(dataList[i].type==3){

                          // },
                          MarkerOption(
                            latLng: getNextLatLng(),
                            title: '北京$i',
                            snippet: '描述$i',
                            // iconUri: i % 2 == 0 ? _assetsIcon1 : _assetsIcon2,
                            imageConfig: createLocalImageConfiguration(context),
                            width: 20,
                            widget: _mapCompany(
                                dataList[i].type, dataList[i].tilte),
                            infoWindowEnabled: false,
//                            rotateAngle: 90,
                            height: 20,
                            object: 'Marker_$i',
                          ),
                      ],
                    )?.then(_markers.addAll);
                  },
                  onMarkerClicked: (Marker marker) async {
                    print(marker.title.then((value) => null));
                    print('sss');
                    marker.title.then((value) => print(value));
                    pushNewPage(context, CompanyDatil());
                    return true;
                  },
                ),
                Container(
                  height: 60,
                  color: Colors.black12,
                  child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('环保管家',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                              )),
                          InkWell(
                              onTap: () {
                                pushNewPage(context, RiverPatrolPage());
                              },
                              child: Image.asset(
                                'assets/fonts/images/Piechart@2x.png',
                                width: 30.0,
                                height: 30.0,
                                fit: BoxFit.contain,
                              ))
                        ],
                      )),
                ),
              ],
            ),
          ),
          LayoutBuilder(
            builder: (_, BoxConstraints constraints) {
              return Container(
                height: 250,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Back Panel",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                    Positioned(
                      // rect: getPanelAnimation(constraints),
                      child: Material(
                        elevation: 12.0,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 50,
                                decoration: BoxDecoration(
                                            // color: Colors.grey,
                                            border: Border(
                                                bottom: BorderSide(
                                                    // 设置单侧边框的样式
                                                    color: Color(0xFFE3E3E3),
                                                    width: 1,
                                                    style: BorderStyle.solid)),
                                          ),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.center ,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            '企业名称',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '地址',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '状态',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Divider(
                                    //   height: 28.0,
                                    //   indent: 20.0,
                                    //   color: Colors.grey,
                                    // ),
                                  ],
                                )),
                            Expanded(
                              child: SafeArea(
                                  top: false,
                                  bottom: false,
                                  child: ListView.separated(
                                      itemBuilder: (_, index) {
                                        var item=dataList[index];
                                        return _itemTitle(item);
                                      },
                                      itemCount: dataList.length,
                                      // physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: false,
                                      separatorBuilder: (context, index) =>
                                      Divider(
                                      height: 28.0,
                                      indent: 0.0,
                                      color: Colors.grey,
                                    ),

                                        )),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _itemTitle(item) {
    return InkWell(
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(134),
            child: Text(
              '${item.tilte}',
              overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(134),
            child: Text(
              '${item.address}',
              overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Container(
            child: Text(
              '有问题',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      )),
    );
  }

  Widget _mapCompany(type, title) {
    var color;
    var path;
    if (type == 0) {
      color = Color(0xFF2FC25B);
      path = 'assets/fonts/images/Map_green@2x.png';
    } else if (type == 1) {
      color = Color(0xFFF04864);
      path = 'assets/fonts/images/Map_red@2x.png';
    } else if (type == 2) {
      color = Color(0xFFFACC14);
      path = 'assets/fonts/images/Map_yellow@2x.png';
    }

    return Container(
        width: ScreenUtil().setWidth(125),
        height: ScreenUtil().setWidth(60),
        // color: Colors.red,
        child: Stack(
          children: <Widget>[
            Container(
              height: ScreenUtil().setWidth(25),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular((13.0)),
              ),
              child: Row(
                children: <Widget>[
                  Gaps.hGap3,
                  Image.asset(
                    '$path',
                    width: ScreenUtil().setWidth(15),
                    height: ScreenUtil().setWidth(15),
                    fit: BoxFit.contain,
                  ),
                  Container(
                    width: ScreenUtil().setWidth(100),
                    child: Text(
                      '$title',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              //方法二
              left: ScreenUtil().setWidth(50),
              top: ScreenUtil().setWidth(14),
              child: Icon(
                Icons.arrow_drop_down,
                color: color,
              ),
            ),
          ],
        ));
  }
}

class CompanyType {
  int type;
  String tilte;
  String address;
  int id;

  CompanyType({this.type, this.tilte, this.id,this.address});
  CompanyType.fromJson(Map<String, dynamic> json) {
    type = json['type'] == null ? "" : json['type'];
    tilte = json['tilte'] == null ? "" : json['tilte'];
    address = json['address'] == null ? "" : json['address'];
    id = json['id'] == null ? "" : json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tilte'] = this.tilte;
    data['address'] = this.address;
    data['type'] = this.type;
  }
}
