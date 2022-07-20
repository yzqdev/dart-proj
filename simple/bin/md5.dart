import 'dart:io';

import 'package:crypto/crypto.dart' as crypto;

bool isPhone(String input) {
  RegExp pathReg = RegExp(r"\.\\");
  return pathReg.hasMatch(input);
}

void main(List<String> arguments) async {
  DateTime now = DateTime.now();

  var filePath = arguments[0];
  if (isPhone(filePath)) {
    filePath = arguments[0].substring(2);
  }
  print(filePath);
  File file = File(filePath);

  try {
    final fileStream = file.openRead();
    var md5 = crypto.md5;
    final checksum = (await md5.bind(fileStream).first).toString();

    print(
        'md51:$checksum，time: ${(DateTime.now().millisecondsSinceEpoch - now.millisecondsSinceEpoch) / 1000}s');
  } catch (e) {
    print(e);
    print("找不到文件");
  }
}
