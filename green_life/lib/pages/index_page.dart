
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provide/current_index_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'river_patrol_page.dart';
import 'rubbish_sort_age.dart';
import 'green_steward_page.dart';




class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('环保管家'),//首页
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text("垃圾分类"),//商城
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_time),
      title: Text("河道巡查"),//预约试驾
    ),
    
  ];

  final List<Widget> tabBodies = [
    DrawPointScreen(),
    RubbishSortPage(),
    RiverPatrolPage(),
  ];

  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context, width: 375, height: 662, allowFontScaling: true);
    return Consumer<CurrentIndexProvide>(

      builder: (context,child,val){

        //取到当前索引状态值
        int currentIndex = Provider.of<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
              items: bottomTabs,
            onTap: (index){
              Provider.of<CurrentIndexProvide>(context,listen: false).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children:tabBodies,
          ),
        );

      },

    );



  }

}