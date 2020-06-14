// import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../page_index.dart';
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
    return Center(
          child:Card(
              child: Container(
                width: 300,
                height: 200,
                padding: const EdgeInsets.all(16),
                child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                foregroundDecoration: const BadgeDecoration(
                  badgeColor: Colors.green,
                  badgeSize: 70,
                  textSpan: TextSpan(
                    text: 'AWESOME',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )),
        
    );
  }
}