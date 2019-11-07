import 'package:flutter_app/src/mo/Analytics/AnalyticsService.dart';

class AnalyticsActivity {
  AnalyticsService analyticsService = new AnalyticsService();

  Future<Map<String, dynamic>> getAnalytics() async{
    Map<String, dynamic> test = await analyticsService.getAnalytics();
    return test;
  }
}
