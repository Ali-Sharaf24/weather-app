import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper {

  NetworkHelper({required this.url});
   String url = "";

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      String data = response.body;
     print(response.body);
      return jsonDecode(data);
    }else{
      print(response.statusCode);
    }
  }
}