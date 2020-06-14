// import 'package:date_format/date_format.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../page_index.dart';
class RiverPatrolPage extends StatefulWidget {
  

  const RiverPatrolPage({Key key,}) : super(key: key);
  @override
  _RiverPatrolPageState createState() => _RiverPatrolPageState();
}

class _RiverPatrolPageState extends State<RiverPatrolPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return LightTheme(
       child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child:Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              
            Container(
              padding: EdgeInsets.only(top:ScreenUtil().setHeight(40)),
              alignment: Alignment.center,
              child:Text('环保管家数据分析',style: TextStyle(fontSize: ScreenUtil().setSp(22)),),
            ),
            Container(
              padding: EdgeInsets.only(top:ScreenUtil().setHeight(30),
              ),
              child:_buildChart(),),
              // Color(0xFF2FC25B), Color(0xFFF04864), Color(0xFFFACC14)
              _statistics(Color(0xFF2FC25B),'没问题','80%','143'),
              Gaps.vGap24,
              _statistics(Color(0xFFF04864),'有问题','13%','23'),
              Gaps.vGap24,
              _statistics(Color(0xFFFACC14),'存疑    ','9%','17'),
              Gaps.vGap40,
              _popPage()

          ],
        )
        )
      ),
    )
    );
  }
  Widget _statistics(color,problem,precent,companyNum){
    return Container(
      alignment: Alignment.center,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(14),
            height: ScreenUtil().setWidth(14),
            decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(7)),
                ),
          ),
          Gaps.hGap5,
          Container(
            child: Text(problem,style: TextStyle(fontSize: ScreenUtil().setSp(18),color: Color(0x73000000))),),
            Gaps.hGap24,
          Container(
            child: Text(precent,style: TextStyle(fontSize: ScreenUtil().setSp(22),color: Color(0xFF444444))),),
            Gaps.hGap24,
          Container(
            child: Text(companyNum,style: TextStyle(fontSize: ScreenUtil().setSp(22),color: Color(0xFF444444))),)
        ],
      ),
    );
  }
  Widget _popPage(){
    return InkWell(
      child: Container(
        alignment:Alignment.center ,
        child: InkWell(
          // child:ClipOval(
          child: Image.asset(
            'assets/fonts/images/popPage.png',
            width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setWidth(80),
            fit: BoxFit.cover,
          ),
          //  ),
           onTap:(){Navigator.pop(context);}
           )));
  }

   _buildChart() {
    return AspectRatio(
      aspectRatio: 1.30,
      // 百分比布局
      child: FractionallySizedBox(
        heightFactor: 0.8,
        child: PieChart(
          name: '',
          data: _getRandomData(),
        ),
      ),
    );
  }
  
  // 数据为前十名数据与剩余数量
  List<PieData> data = [];
  List<PieData> data1 = [];
  _getRandomData() {
    data1 = [];
    if (data.isEmpty) {
      for (int i = 0; i < 3; i++) {
        PieData pieData = PieData();
        if (i == 0) {
          pieData.name = '';
          pieData.number = 17; 
          // pieData.percentage = 0.5;
        } else if(i==1) {
         
          pieData.name = '';
          pieData.number = 23;

        } else if(i==2) {
          pieData.name = '';
          pieData.number = 140;
        } 
        data1.add(pieData);
      }
    }
    return data1;
    }
}