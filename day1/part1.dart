import "../aoc.dart" as aoc;

int calibrationValue = 0;
void main() async {
  RegExp exp = RegExp(r'(\d{1})');
  var inputFile = await aoc.getInputFileForDay(3);
  inputFile
      .readAsLines()
      .then((lines) => lines.forEach((line) {
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
