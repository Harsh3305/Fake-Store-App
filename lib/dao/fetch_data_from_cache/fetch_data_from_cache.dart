class FetchDataFromCache {
  static Map<String, Object> _cacheMap = {};
  static void storeInCache(String key, Object value) {
    _cacheMap[key] = value;
  }

  static Object? getFromCache(String key) {
    if (_cacheMap.containsKey(key)) {
      return _cacheMap[key];
    } else {
      return null;
    }
  }
}
