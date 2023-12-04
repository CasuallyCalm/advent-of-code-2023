import "../aoc.dart" as aoc;

int calibrationValue = 0;

String numberConvert(String input) {
  final conversions = {
    "one": "o1e",
    "eight": "e8t",
    "two": "t2o",
    "three": "t3e",
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "nine": 9,
  };
  conversions.forEach((key, value) {
    input = input.replaceAll(key, value.toString());
  });
  return input;
}

void main() async {
  RegExp exp = RegExp(r'(\d{1})');
  var inputFile = await aoc.getInputFileForDay(3);
  inputFile
      .readAsLines()
      .then((lines) => lines.forEach((line) {
            line = numberConvert(line);
            if (exp.hasMatch(line)) {
              var matches =
                  exp.allMatches(line).map((e) => e.group(0)).toList();
              var firstNumber = matches[0];
              var lastNumber = matches[matches.length - 1];
              calibrationValue += int.parse(firstNumber! + lastNumber!);
            }
          }))
      .then((value) => print(calibrationValue));
}
