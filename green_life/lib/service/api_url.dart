class ApiUrl {
  static const String BASE_URL = 'http://106.14.47.155:3000/';
//  static const String TESTBASE_URL = 'http://192.168.2.123:9006/';
   static const String TESTBASE_URL = 'http://116.236.19.122:12401/yfapp-shop/';
//  static const String TESTBASE_URL = 'http://192.168.1.27:9006/';

  //  static final String imgIp="http://192.168.2.120";//图片访问
  static final String imgIp="http://116.236.19.122:12001";

  // static const String UPLOAD_BASE_URL = 'http://192.168.2.123:9009/';//上传文件ip
  static const String UPLOAD_BASE_URL = 'http://116.236.19.122:12302/';//上传文件ip

  static const String GET_MSG = 'message/sendMsg';//获取手机短信
  static const String RegisterNomal_User = 'yfUser/registerNomalUser';//注册分用户和企业注册
  static const String Login = 'yfUser/login';//登录接口
  static const String ChangePhone = 'yfUser/chgPhone';//修改手机号
  static const String ChangePassWord = 'yfUser/chgPassWord';//修改密码

  static const String DoUpload = 'fastdfs/doUpload';//上传文件
  static const String SelHomeCfgAll = 'selHomeCfgAll';//app首页配置(全部分类)列表查询
  static const String SelHomeCfgList = 'selHomeCfgList';//app首页配置(按分类)列表查询
  static const String SelProductList = 'selProductList';//app首页配置(按分类)列表查询
  static const String SelGrpProductList = 'selGrpProductList';//团购商品列表查询
  static const String SelPanProductList = 'selPanProductList';//抢购商品列表查询
  static const String GetProductById = 'getProductById';//抢购商品列表查询
  static const String SelMallCfgList = 'selMallCfgList';//商城首页按分类接口
  static const String SelMallCfgAll = 'selMallCfgAll';//商城全部分类接口
  static const String SelPrdBrandList = 'selPrdBrandList';//商品品牌查询
  static const String AddVehMode = 'yfVeh/addVehMode';//管理车型
  static const String GetVehModelList = 'yfVeh/getVehModelList';//网点车系列表查询
  static const String QueryVehDealer = 'yfVeh/queryVehDealer';//服务网点查询
  static const String GetModelList = 'yfVeh/getModelList';//品牌车系车型查询
  static const String GetVehModelDeatail = 'yfVeh/getVehModelDeatail';//yfVeh/getVehModelDeatail车系详情查询
  static const String GetProductCommentList = 'getProductCommentList';//商品评论查询
  static const String SelPrdCategoryByPid = 'selPrdCategoryByPid';//商品订单列表查询
  static const String AddProductCart = 'addProductCart';//商品购物车新增
  static const String DelPrdCartBatchByIds = 'delPrdCartBatchByIds';//商品购物车删除
  static const String DelPrdCartByUserId = 'delPrdCartByUserId';//商品购物车清空
  static const String GetProductCartList = 'getProductCartList';//商品订单列表查询
  static const String GetProductByIds = 'getProductByIds';//getProductByIds商品详情集合查询
  static const String RefreshPrdCartByUserId = 'refreshPrdCartByUserId';//商品购物车刷新
  static const String UpdateProductCart = 'updateProductCart';//商品购物车修改
  static const String AddProductOrder = 'addProductOrder';//商品订单新增
  static const String AddTestDrive = 'yfTestDrive/addTestDrive';//yfTestDrive/addTestDrive提交预约试驾   
  static const String QueryTestDriveList = 'yfTestDrive/queryTestDriveList';///yfTestDrive/queryTestDriveList查询试驾列表  
  static const String AddMaintain = 'yfMaintain/addMaintain';//yfMaintain/addMaintain提交维保预约
  static const String QueryMaintainceName = 'yfMaintain/queryMaintainceName';//yfMaintain/queryMaintainceName维修人员查询
  static const String QueryMaintainTime = 'yfMaintain/queryMaintainTime';///yfMaintain/queryMaintainTime查询维保预约时间段
  static const String QueryMaintainList = 'yfMaintain/queryMaintainList';//yfMaintain/queryMaintainList查询维保预约列表
  static const String OrderPayment = 'orderPayment';///orderPayment商品订单支付
  static const String GetProductOrderById = 'getProductOrderById';///getProductOrderById商品订单详情
  //订单
  static const String OrderOptSend = 'productOrderDeliv';//商品订单发货
  static const String OrderOptRefuseSend = 'storeReturnOrder';//门店返换商品订单(无法发货)
  static const String OrderOptConfirmReceipt = 'upOrderWaitEvalByIdUrl';//商品订单确认收货
  static const String OrderOptSettlement = 'yfMaintain/settlementOrder';//结算
  //推荐
  static const String AddRecommend = '/yfUser/addRecommend';//推荐用户
  static const String GetRecommendList = '/yfUser/getRecommendList';//查询推荐列表





  //用户信息
  static const String ChangeUserInfo = 'yfUser/updateUser';//修改用户信息
  static const String QueryUserInfo = 'yfUser/queryUser';//查询用户信息
  //地址
  static const String QueryAddressList = 'yfAddress/getAddressList';//地址查询
  static const String AddAddress = 'yfAddress/saveAddress';//保存地址
  static const String UpdateAddress = 'yfAddress/updateAddress';//yfAddress/updateAddress编辑地址
  static const String DeleteAddress = 'yfAddress/deleteAddress';//yfAddress/deleteAddress删除地址

  //我的工作台
  static const String SelProductOrderList = 'selProductOrderList';//订单
  static const String QueryMaintainRoleOrderList = 'yfMaintain/queryRoleOrderList';//角色订单查询
  static const String OptMaintainOrderList = 'yfMaintain/updateMaintainStatus';//取消,确认维保预约订单
  //试驾
  static const String QueryTestDriveOrderList = 'yfTestDrive/querySaleOrderList';//试驾销售顾问订单查询
  static const String OptTestDriveOrderList = 'yfTestDrive/updateDriveStatus';//取消,确认试驾订单
  //我的维保预约
  static const String MaintainOptCommit = 'yfComment/addComment';//维保预约添加评论

  static const String QueryDriverList = 'yfVeh/queryVehList';//查询车辆管理列表

  static const String AddProductComment = 'addProductCommentBath';//addProductComment商品评论新增

  //优惠券
  static const String QueryJuanList = 'yfUser/getProductCommentList';//用户优惠券



  static const String LOGIN = 'users/login';
  static final String CITY_BASE_URL = 'https://search.heweather.net';
  static final String CITY_TOP = '/top';

  static final String BOOK_URL = 'http://api.zhuishushenqi.com';

  /// 搜索热词
  static final String BOOK_HOT_WORDS_URL = '/book/hot-word';



  /// 搜索热词
//  static final String BOOK_URL = '/book/hot-word';

  //商品列表
  static final GoodsList = "getHomePageContent";
  //商品详情
  static final GoodsInfo = "getGoodDetail";
  //评论详情
  static final CommentsInfo = "getComments";
  //订单数据
  static final OrderInfo = "getOrderInfo";


}
