import '../domain/spa_model.dart';
import 'spa_details_model.dart';

abstract class AbSpaService {
  Future<List<SpaModel>> fetchSpas();
  Future<SpaDetailsModel?> fetchSpaById(String spaId);
}
