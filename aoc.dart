import "package:http/http.dart" as http;
import "dart:io";

String _baseUrl = "adventofcode.com";

Future<File> getInputFileForDay(int day) async {
  var file = File("./day${day}/input.txt");
  if (!file.existsSync()) {
    file.createSync(recursive: true);
    var body = await _requestInputForDay(day);
    await file.writeAsString(body);
    print('Created input file for day ${day}');
  }
  return file;
}

Future<String> _requestInputForDay(int day) async {
  '''session is a file containing the session id for AoC''';
  var url = Uri.https(_baseUrl, "/2023/day/${day}/input");
  var session = await File("./session").readAsString();
  var response = await http.get(url, headers: {"Cookie": "session=${session}"});
  return response.body.toString();
}
