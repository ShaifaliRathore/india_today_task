import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'api_constants.dart';
import 'package:india_today_task/model/daily_panchang.dart';

class ApiService {
  static Future<DailyPanchang> getDailyPanchang(data) async {
    final url = APIConstants.panchang;
    log("URL:" + url);
    log("DATA:" + json.encode(data));
    try {
      log("RESPONSE");
      var response = await http.post(Uri.parse(url),
          body: json.encode(data));
      log("RES:");
      var responseJson = json.decode(response.body);
      return DailyPanchang.fromJson(responseJson);
    } catch (error) {
      log("error" + error);
      return Future.error(error);
    }
  }
}
