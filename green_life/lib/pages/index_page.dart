import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provide/current_index_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'river_patrol_page.dart';
import 'rubbish_sort_age.dart';
import 'green_steward_page.dart';

class IndexPage extends StatelessWidget {
  var tabImages;

  Image getTabIcon(int curIndex, int _currentIndex) {
    if (curIndex == _currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Image getTabImage(path) {
    return new Image.asset(
      path,
      width: 30.0,
      height: 30.0,
      fit: BoxFit.contain,
    );
  }

  final List<BottomNavigationBarItem> bottomTabs = [];

  final List<Widget> tabBodies = [
    DrawPointScreen(),
    RubbishSortPage(),
    RiverPatrolPage(),
  ];
  void init() {
      tabImages = [
      [getTabImage('assets/fonts/images/icon01_black@2x.png'), 
      getTabImage('assets/fonts/images/icon01_green@2x.png')
      ],
        [
          getTabImage('assets/fonts/images/icon02_black@2x.png'),
          getTabImage('assets/fonts/images/icon02_green@2x.png')
        ],
        [
          getTabImage('assets/fonts/images/icon03_black@2x.png'),
          getTabImage('assets/fonts/images/icon03_green@2x.png')
        ],
      ];

    }

  @override
  Widget build(BuildContext context) {
    init();
    ScreenUtil.init(context, width: 375, height: 662, allowFontScaling: true);
    return Consumer<CurrentIndexProvide>(
      builder: (context, child, val) {
        //取到当前索引状态值
        int currentIndex =
            Provider.of<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: getTabIcon(0, currentIndex),
                title: Text('环保管家'), //首页
              ),
              BottomNavigationBarItem(
                icon: getTabIcon(1, currentIndex),
                title: Text("垃圾分类"), //垃圾分类
              ),
              BottomNavigationBarItem(
                icon: getTabIcon(2, currentIndex),
                title: Text("河道巡查"), //河道巡查
              ),
            ],
            onTap: (index) {
              Provider.of<CurrentIndexProvide>(context, listen: false)
                  .changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}
