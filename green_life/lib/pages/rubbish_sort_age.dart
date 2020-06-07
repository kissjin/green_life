// import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../page_index.dart';
class RubbishSortPage extends StatefulWidget {
  

  const RubbishSortPage({Key key,}) : super(key: key);
  @override
  _RubbishSortPageState createState() => _RubbishSortPageState();
}

class _RubbishSortPageState extends State<RubbishSortPage> {

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
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:ScreenUtil().setHeight(120)),
              child:Text('垃圾分类'),)
          ],
        )
        )
      ),
    )
    );
  }
}