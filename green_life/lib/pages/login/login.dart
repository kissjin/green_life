import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../page_index.dart';
import '../index_page.dart';
import 'package:flui/flui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodePassword = FocusNode();
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 662, allowFontScaling: true);
    return LightTheme(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(120)),
                child: Text(
                  '欢迎使用勘查记录App',
                  style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                ),
              ),
              GU.hGap(50),

              /// 输入邮箱
              Container(
                height: ScreenUtil().setHeight(55),
                decoration: BoxDecoration(border: GU.borderBottom()),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: '账号 / 手机号',
                      hintStyle: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 14,
                      )),
                  onChanged: (e) {
                    RegExp regExp = RegExp(
                        "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+");
                    setState(() {
                      // email['value'] = e;
                      // email['verify'] = regExp.hasMatch(e);
                    });
                  },
                ),
              ),

              /// 输入邮箱
              CustomTextField(
                focusNode: _nodePassword,
                isInputPwd: true,
                controller: _passwordController,
                maxLength: 16,
                hintText: "登录密码",
                hintTextStyle: TextStyles.textStyle(
                    color: Color(0xFF999999), fontSize: ScreenUtil().setSp(14)),
              ),
              GU.hGap(5),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            onTap: () {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    isSelected
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
                                    color: isSelected
                                        ? Color(0x9927C277)
                                        : Colors.grey.withOpacity(0.6),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '记住密码',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GU.hGap(5),
              FLLoadingButton(
                child: Text('登录'),
                color: Color(0x9927C277),
                disabledColor: Color(0xFF0F4C81),
                indicatorColor: Colors.white,
                disabledTextColor: Colors.grey.withAlpha(40),
                textColor: Colors.white,
                // loading: _loading,
                height: ScreenUtil().setHeight(45),
                minWidth: ScreenUtil().setWidth(315),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                onPressed: () {
                  login();
                  // setState(() => _loading = true);
                  Future.delayed(
                    Duration(seconds: 3),
                    // () => setState(() => _loading = false)
                  );
                },
              )
            ],
          ))),
    ));
  }

  void login() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              //  title: Text('选择地图',textAlign: TextAlign.center,),
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    GU.hGap(20),
                    Text(
                      '密码或账号名错误',
                      style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                    ),
                    GU.hGap(5),
                    Text(
                      '请重新输入',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15), color: Colors.grey),
                    ),
                    GU.hGap(50),
                    GU.line,
                    GU.hGap(10),
                    InkWell(
                      onTap: (){Navigator.pop(context);},
                      child: Container(
                        child:Text("重新输入",
                         style: TextStyle(
                          fontSize: ScreenUtil().setSp(18), color: Color(0x9927C277)),
                        ) ,
                        
                        ),
                    )
                  ],
                ))
              ]);
        });
    pushNewPage(context, IndexPage());
  }
}
