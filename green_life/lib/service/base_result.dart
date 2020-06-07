class BaseResult<T> {
  String code;
  String status;
  String message;
  String token;
  String apiCode;
  String body;
  String errorCode;
  String errorMessage;
  String extMessage;
  String randomstr;
  String sign;
  String timestamp;
  String transationid;
  T data;

  BaseResult({
    this.apiCode,
     this.body, 
     this.errorCode, 
     this.errorMessage, 
     this.extMessage, 
     this.randomstr, 
     this.sign, 
     this.transationid, 
     this.status, 
     this.timestamp,
     this.token,
    this.code, 
    this.message, 
    this.data
    });

  static BaseResult fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BaseResult result = BaseResult();
    result.body = map['body'];
    result.errorCode = map['errorCode'];
    result.errorMessage = map['errorMessage'];
    result.extMessage = map['extMessage'];
    result.sign = map['sign'];
    result.transationid = map['transationid'];
    result.status = map['status'];
    result.timestamp = map['timestamp'];
    result.message = map['message'];
    // result.code = '${map['code']}';
    result.token = map['token'];
    // result.message = map['message'];
    result.data = map['data'];
    return result;
  }

  Map<String, dynamic> toJson() => {
        // "code": code,
        "body":body,
        "token": token,
        "data": data,
        "status": status,
        "status": status,
        "errorCode":errorCode,
        "extMessage":extMessage
      };
}
