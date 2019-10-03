import 'Attachment.dart';

class EventService {
  getValues( ) {
    List<Attachment> attachmentList = new List( );
    for (var i = 0; i < 5; i++) {
      Attachment attachment = new Attachment( );
      attachment.fileName = "main" + i.toString ( ) + ".png";
      attachment.extension = "png";
      attachmentList.add ( attachment );
    }
    return attachmentList;
  }
}