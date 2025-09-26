import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final _storage = GetStorage();

  //Method to save data
  static void saveData<T>({required String key, required T value}) {
    _storage.write(key, value);
  }

  //Method to read data
  static T? readData<T>({required String key}) {
    return _storage.read<T>(key);
  }

  //Method to remove data
  static void removeData<T>({required String key}) {
    _storage.remove(key);
  }

  //Method to clear data
  static void clearData() {
    _storage.erase();
  }
}
