import 'dart:convert';

class JsonParser {
  void init() {
    final questions = json.decode('[1, 2, { "a": null }]');
    questions[0];
  }
}
