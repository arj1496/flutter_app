import 'Standard.dart';
import 'StandardService.dart';

class StandardActivity{
  StandardService standardService = new StandardService();
  Future<List<Standard>> getStandardListFromLocalDB() async{
    List<Standard> standardListFromFuture = await standardService.getStandardListFromLocalDB();

    return standardListFromFuture;
  }


}