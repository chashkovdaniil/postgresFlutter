import 'dart:math';

String generateEmail([int lengthName = 20, int lengthDomain = 10]) {
  var result = '';

  result += generateWord(lengthName);
  result += '@';
  result += generateWord(lengthDomain);
  result += '.ru';
  return result;
}

String generateWord(int length) {
  const letters = 'abcdefghijkmnlopqrstuvwxyz';
  var word = '';
  for (var i = 0; i < length; i++) {
    word += letters[Random().nextInt(length)];
  }
  return word;
}
