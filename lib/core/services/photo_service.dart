import 'dart:io';

import 'dart:math';

class PhotoService {
  final homePath = Platform.environment['HOME'];

  get pathApp => Directory('$homePath/.local/share/postgres');

  get pathPhotos => Directory('$homePath/.local/share/postgres/photos');

  void _checkingDirs() {
    if (!pathApp.existsSync()) {
      pathApp.createSync();
    }
    if (!pathPhotos.existsSync()) {
      pathPhotos.createSync();
    }
  }

  Future<File> savePhoto(File file) async {
    return await file.copy(
      '${pathPhotos.path}/${Random().nextInt(4294967296)}-'
      '${DateTime.now().toLocal()}.png',
    );
  }
}
