class ParseHelper {
  static int toInt(dynamic value, {int fallback = 0}) {
    if (value == null) return fallback;
    if (value is int) return value;
    if (value is double) return value.round();
    return int.tryParse(value.toString()) ?? fallback;
  }

  static bool? toBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is num) return value != 0;
    final text = value.toString().toLowerCase();
    if (text == 'true' || text == '1') return true;
    if (text == 'false' || text == '0') return false;
    return null;
  }

  static String text(dynamic value, {String fallback = ''}) {
    if (value == null) return fallback;
    return value.toString();
  }

  static String imageUrl(dynamic value) {
    if (value == null) return '';
    if (value is String) return value;
    if (value is Map) {
      return (value['url'] ??
              value['original_url'] ??
              value['src'] ??
              value['image'] ??
              '')
          .toString();
    }
    return value.toString();
  }

  static Map<String, dynamic> mapOf(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);
    return <String, dynamic>{};
  }

  static List<Map<String, dynamic>> mapList(dynamic value) {
    dynamic list = value;
    if (list is Map && list['data'] is List) {
      list = list['data'];
    }
    if (list is! List) return [];
    return list
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }
}
