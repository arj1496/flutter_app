
import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayDAO.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayWebService.dart';

class HolidayService {

  HolidayDAO holidayDAO = new HolidayDAO();
  HolidayWebService holidayWebService=new HolidayWebService();

  Future<List<Holiday>> getDbHolyday() async{
    List<Holiday> holidayListFromFuture = await holidayDAO.getDbHoliday();
    return holidayListFromFuture;
  }


  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async {
    List<dynamic> holidaysDynamic = syncDataResponse['holidays'];
    if (holidaysDynamic != null && holidaysDynamic.length > 0) {
      List<Holiday> holidayList = List.generate(holidaysDynamic.length, (i) {
        Holiday holiday = Holiday.fromJson(holidaysDynamic[i]);
        return holiday;
      });
      await holidayDAO.batchAddHoliday(holidayList);
    }
  }


  Future<int> addHD(Holiday holiday) async{
    Map<String, dynamic> HDData = await holidayWebService.addOrUpdateHoliday(holiday);
    // if the response is true and the examId is present allredy update that exam otherwise add that exam to local database
    if(HDData['status']){
      Holiday holiday = Holiday.fromJson(HDData['holiday']);
      if(holiday != null){
         addHD(holiday);
      }
    }else{
      print('Holiday Add False');
    }
    return null;
  }


/*  batchAddHD(List<Holiday> HDList) {
    holidayDAO.batchAddHoliday( HDList );
  }*/

}