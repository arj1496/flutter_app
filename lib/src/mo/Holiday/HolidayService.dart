



import 'package:flutter_app/src/mo/Holiday/Holiday.dart';
import 'package:flutter_app/src/mo/Holiday/HolidayDAO.dart';

class HolidayService {

  HolidayDAO holidayDAO = new HolidayDAO();

  Future<List<Holiday>> getDbHolyday() async{
    List<Holiday> holidayListFromFuture = await holidayDAO.getDbHoliday();
    return holidayListFromFuture;
  }

  /*static List<Holiday> getAllHoliday() {
    List<Holiday> holidayList = new List();
    for (var i = 1; i < 3; i++) {
      Holiday holiday = new Holiday();
      holiday.id = i;
      holiday.name = 'sunday' + i.toString();
      holiday.startDate = 1572021449 + i;
      holiday.endDate = 1572021449 + i;
      //standard.startTime = "2" + i.toString();
      // standard.endTime = "2" + i.toString();
      holidayList.add(holiday);
    }
    return holidayList;
  }*/

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
}