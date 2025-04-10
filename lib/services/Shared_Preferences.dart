import 'package:admin_app/core/constant/shardPref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _prefs;

  SharedPreferencesService._internal(); // Private constructor

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._internal();
    _prefs ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  // Generic getter
  T? _get<T>(String key) {
    if (_prefs == null) return null;
    dynamic value = _prefs!.get(key);
    if (value is T) return value;
    return null;
  }

  // Generic setter
  Future<void> _set<T>(String key, T value) async {
    if (_prefs == null) return;
    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    }
  }

  // admin Getters
  int? getAdminID() => _get<int>(ShardprefKeys.adminID);
  String? getAdminName() => _get<String>(ShardprefKeys.adminName);
  String? getAdminEmail() => _get<String>(ShardprefKeys.adminEmail);
  String? getAdminPhoneNumber() => _get<String>(ShardprefKeys.adminPhoneNumber);
  int? getAdminBinaryPermissionsNumber() => _get<int>(ShardprefKeys.adminBinaryPermissionsNumber);
  String? getAdminCreatedDate() => _get<String>(ShardprefKeys.adminCreatedDate);
  bool getIsLoggedIn() => _get<bool>('isLoggedIn') ?? false;





  // Setters
  Future<void> setAdminID(int value) async => await _set(ShardprefKeys.adminID, value);
  Future<void> setAdminName(String value) async => await _set(ShardprefKeys.adminName, value);
  Future<void> setAdminEmail(String value) async => await _set(ShardprefKeys.adminEmail, value);
  Future<void> setAdminPhoneNumber(String value) async => await _set(ShardprefKeys.adminPhoneNumber, value);
  Future<void> setAdminBinaryPermissionsNumber(int value) async => await _set(ShardprefKeys.adminBinaryPermissionsNumber, value);
  Future<void> setAdminCreatedDate(String value) async => await _set(ShardprefKeys.adminCreatedDate, value);
  Future<void> setIsLoggedIn(bool value) async => await _set('isLoggedIn', value);

  // Clear all data
  Future<void> clearData() async => await _prefs?.clear();
}
