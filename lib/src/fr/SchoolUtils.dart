


class SchoolUtils {

  static final SchoolUtils _schoolUtils = new SchoolUtils._internal();

  factory SchoolUtils() {
    return _schoolUtils;
  }

  //String baseUrl = "https://educloud.in";
  String baseUrl = "http://192.168.0.116:8080/soms/";

  SchoolUtils._internal(){


  }

  Future<int> initApp() async{
   final result = await Future.delayed(const Duration(milliseconds: 5000), (){
      return Future.value(1);
    });

    return result;
  }
}


