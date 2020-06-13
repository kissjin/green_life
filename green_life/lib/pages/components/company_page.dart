import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../page_index.dart';

class CompanyDatil extends StatefulWidget {
  CompanyDatil({Key key}) : super(key: key);

  @override
  _CompanyDatilState createState() => _CompanyDatilState();
}

class _CompanyDatilState extends State<CompanyDatil> {
  @override
  Widget build(BuildContext context) {
    return LightTheme(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
               SizedBox(height: 10),
              _companyDatil(),
              _swiper(),
              _button()
            ],
          )),
    ));
  }

  Widget _companyDatil() {
    return Container(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('上海中得印务有限公司'),
          Text('翔黄路198号智尚园区6-15'),
          Container(
            child: Row(
              children: <Widget>[
                Text('环保管家'),
                Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(64),
                    height: ScreenUtil().setHeight(24),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      '有问题',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _swiper() {
    return Container(
      height: ScreenUtil().setHeight(540),
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Swiper(
        fade: 0.0,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(480),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    // topRight: Radius.circular(10.0)),
                    image: DecorationImage(
                        image: NetworkImage(bannerImages[index]),
                        fit: BoxFit.cover)),
              ),
            ],
          );
        },
        itemCount: 4,
        scale: 0.9,
        pagination: SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            return Container(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                dotsCount: 4,
                position: config.activeIndex,
                reversed: false,
                decorator: DotsDecorator(
                  activeColor: Color(0xFF27C277),
                  size: const Size(8.0, 4.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0)),
                  activeSize: const Size(8.0, 4.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  Widget _button(){
    return Container(
      // decoration: Boxdoctorn,
      child:Text("×") ,
      );
  }
}

// class SwiperSample extends StatelessWidget {
//   SwiperSample({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Swiper')),
//         body: ListView(physics: BouncingScrollPhysics(), children: <Widget>[]));
//   }
// }
