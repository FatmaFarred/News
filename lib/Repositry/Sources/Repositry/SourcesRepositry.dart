import '../../../Apis/RecourceResponce.dart';
/// interface
abstract class Sources_Respositry {
  Future<RecourceResponce?>getSources (String categoryId);
}