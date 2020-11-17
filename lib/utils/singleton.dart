
class Singleton {

  String token;
  Singleton._privateConstructor();

  static final Singleton _instance = Singleton._privateConstructor();

  factory Singleton() {
    return _instance;
  }

  void setToken(String tk){
    token = tk;
  }
  String getToken(){
    return token;
  }

}