import 'dart:convert';

dynamic tryParseJson(String raw) {
  try {
    return json.decode(raw);
  } catch (_) {
    return null;
  }
}
