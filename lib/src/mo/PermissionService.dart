
import 'dart:convert';

class PermissionService{


  syncCallBackHandle(Map<String, dynamic> syncDataResponse) async{
    List<dynamic> permissionsDynamic = json.decode(syncDataResponse['permission']);
    if(permissionsDynamic != null && permissionsDynamic.length > 0){
      List<String> permissionList = List.generate(permissionsDynamic.length, (i){
        return permissionsDynamic[i];
      });
      // await batchAddPermission(permissionList);
    }

  }

}