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


final _networkIcon = Uri.parse(
    'https://w3.hoopchina.com.cn/30/a7/6a/30a76aea75aef69e4ea0e7d3dee552c7001.jpg');
final _assetsIcon1 = Uri.parse('https://w3.hoopchina.com.cn/30/a7/6a/30a76aea75aef69e4ea0e7d3dee552c7001.jpg');
final _assetsIcon2 = Uri.parse('https://w3.hoopchina.com.cn/30/a7/6a/30a76aea75aef69e4ea0e7d3dee552c7001.jpg');

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
                      await controller.setZoomLevel(6);
                    }
                    _controller?.addMarkers(
                      [
                        for (int i = 0; i < 3; i++)
                          MarkerOption(
                            latLng: getNextLatLng(),
                           title: '北京$i',
//                            snippet: '描述$i',
                            iconUri: i % 2 == 0 ? _assetsIcon1 : _assetsIcon2,
                            imageConfig: createLocalImageConfiguration(context),
                            width: 20,
                            infoWindowEnabled: false,
//                            rotateAngle: 90,
                            height: 20,
                            object: 'Marker_$i',
                          ),
                      ],
                    )?.then(_markers.addAll);
                  },
                  onMarkerClicked: (Marker marker) async{
                    print(marker.title.then((value) => null));print('sss');
                    marker.title.then((value) => print(value));
                    pushNewPage(context, CompanyDatil());
                    return true;
                    },

                ),
                Container(
                  height: 60,
                  color: Colors.black12,
                  child:  Padding(
                        padding: EdgeInsets.only(left:16,right:16,top: 20),
                 child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                     
                       Text('环保管家',style: TextStyle(fontSize: ScreenUtil().setSp(20),)),
                      
                      
                      Icon(Icons.queue_play_next),
                    ],
                  )),
                ),
              ],
            ),
          ),
          Flexible(
            child: DecoratedColumn(
              scrollable: true,
              divider: kDividerTiny,
              children: <Widget>[
                ListTile(
                  title: Center(child: Text('添加Widget Marker')),
                  onTap: () async {
                    final marker = await _controller?.addMarker(
                      MarkerOption(
                        latLng: getNextLatLng(),
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('使用Widget作为Marker'),
                            FlutterLogo(size: 80),
                          ],
                        ),
                        imageConfig: createLocalImageConfiguration(context),
                        title: '北京',
                        snippet: '描述',
                        width: 100,
                        height: 100,
                      ),
                    );
                    _markers.add(marker);

                  },
                ),
                ListTile(
                  title: Center(child: Text('添加Marker')),
                  onTap: () async {
                    final marker = await _controller?.addMarker(
                      MarkerOption(
                        latLng: getNextLatLng(),
                        title: '北京',
                        snippet: '描述',
                        iconUri: _assetsIcon1,
                        imageConfig: createLocalImageConfiguration(context),
                        width: 48,
                        height: 48,
                        object: '自定义数据',
                      ),
                    );
                    _markers.add(marker);
                  },
                ),
                ListTile(
                  title: Center(child: Text('移动Marker坐标')),
                  onTap: () async {
                    await _markers?.first?.setCoordinate(getNextLatLng());
                  },
                ),
                ListTile(
                  title: Center(child: Text('添加一个不显示的marker')),
                  onTap: () async {
                    await _hiddenMarker?.remove();
                    _hiddenMarker = await _controller?.addMarker(
                      MarkerOption(
                        latLng: getNextLatLng(),
                        title: '北京',
                        snippet: '描述',
                        iconUri: _assetsIcon1,
                        imageConfig: createLocalImageConfiguration(context),
                        visible: false,
                      ),
                    );
                  },
                ),
                BooleanSetting(
                  head: '是否显示隐藏的Marker',
                  selected: false,
                  onSelected: (visible) async {
                    await _hiddenMarker?.setVisible(visible);
                  },
                ),
                ListTile(
                  title: Center(child: Text('调用方法开启弹窗')),
                  onTap: () async {
                    if (_markers.isNotEmpty) {
                      final marker = _markers[0];
                      marker.showInfoWindow();
                    }
                  },
                ),
                ListTile(
                  title: Center(child: Text('调用方法关闭弹窗')),
                  onTap: () async {
                    if (_markers.isNotEmpty) {
                      final marker = _markers[0];
                      marker.hideInfoWindow();
                    }
                  },
                ),
                ContinuousSetting(
                  head: '添加旋转角度的Marker',
                  onChanged: (value) async {
                    await _controller?.clearMarkers(_markers);
                    final marker = await _controller?.addMarker(
                      MarkerOption(
                        latLng: LatLng(39.90960, 116.397228),
                        title: '北京',
                        snippet: '描述',
                        iconUri: _assetsIcon1,
                        draggable: true,
                        imageConfig: createLocalImageConfiguration(context),
                        rotateAngle: 360 * value,
                        anchorU: 0,
                        anchorV: 0,
                      ),
                    );
                    _markers.add(marker);
                  },
                ),
                ListTile(
                  title: Center(child: Text('批量添加Marker')),
                  onTap: () {
                    _controller?.addMarkers(
                      [
                        for (int i = 0; i < 100; i++)
                          MarkerOption(
                            latLng: getNextLatLng(),
//                            title: '北京$i',
//                            snippet: '描述$i',
                            iconUri: i % 2 == 0 ? _assetsIcon1 : _assetsIcon2,
                            imageConfig: createLocalImageConfiguration(context),
                            width: 40,
                            infoWindowEnabled: false,
//                            rotateAngle: 90,
                            height: 40,
                            object: 'Marker_$i',
                          ),
                      ],
                    )?.then(_markers.addAll);
                  },
                ),
                ListTile(
                  title: Center(child: Text('删除Marker')),
                  onTap: () async {
                    if (_markers.isNotEmpty) {
                      await _markers[0].remove();
                      _markers.removeAt(0);
                    }
                  },
                ),
                ListTile(
                  title: Center(child: Text('清除所有Marker')),
                  onTap: () async {
                    await _controller.clearMarkers(_markers);
                  },
                ),
                ListTile(
                  title: Center(child: Text('Marker添加点击事件')),
                  onTap: () {
                    _controller?.setMarkerClickedListener((marker) async {
                      marker.setIcon(
                          _assetsIcon2, createLocalImageConfiguration(context));
                      return true;
                    });
                  },
                ),
                ListTile(
                  title: Center(child: Text('Marker添加拖动事件')),
                  onTap: () {
                    _controller?.setMarkerDragListener(
                      onMarkerDragEnd: (marker) async {
                        // toast(
                        //   '${await marker.title}, ${await marker.location}',
                        // );
                      },
                    );
                  },
                ),
                ListTile(
                  title: Center(child: Text('监听Marker弹窗事件')),
                  onTap: () async {
                    await _controller
                        ?.setInfoWindowClickListener((marker) async {
                      // toast('${await marker.title}, ${await marker.location}');
                      return false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
