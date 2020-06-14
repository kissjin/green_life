import 'package:flutter/material.dart';
import './routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './routers/application.dart';
import './pages/login/login.dart';
import 'package:provider/provider.dart';
import './provide/current_index_provide.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'page_index.dart';



void main() async{
  // runApp(MyApp());
    WidgetsFlutterBinding.ensureInitialized();
  //    runZoned(() {
  //   //强制横屏
  //   // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //     const bool inRelease = const bool.fromEnvironment("dart.vm.product");
  //     // LogUtil.init(isDebug: !inRelease);
  //   /// 强制竖屏
  //   SystemChrome.setPreferredOrientations(
  //           [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
  //       .then((_) {
  //     Utils.statusBarEnable(true);
  //     // runApp(ProviderNode(child: MyApp(), providers: providers));
  //     runApp(MultiProvider(
  //     providers:[
  //       ChangeNotifierProvider(create: (context)=>CurrentIndexProvide()),
  //     ],
  //     child: MyApp(),
  //   ));
  //     // if (Platform.isAndroid) {
  //     //   // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  //     //   SystemUiOverlayStyle systemUiOverlayStyle =
  //     //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //     //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  //     // }
  //   });
  // }, onError: (Object error, StackTrace stack) {
  //   debugPrint(error.toString());
  //   debugPrint(stack.toString());
  // });
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>CurrentIndexProvide()),],
        child: MyApp(),
        ));
  await AmapService.init(
    iosKey: '7a04506d15fdb7585707f7091d715ef4',
    androidKey: 'f20a9e117260c8d4ec40c050e03de431',
  );
  await enableFluttifyLog(false);


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    // ScreenUtil.init(context, width: 375, height: 662, allowFontScaling: true);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        primaryColor: Color(0xFF27C277),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage());
  }
}
