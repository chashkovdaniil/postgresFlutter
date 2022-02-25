import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

class FileConverter implements JsonConverter<File, String> {
  const FileConverter();
  @override
  File fromJson(String json) {
    return File.fromUri(Uri(path: json));
  }

  @override
  String toJson(File object) {
    return object.path;
  }
}
