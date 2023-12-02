import "dart:io";

int calibrationValue = 0;
final String fileUri = "./day1/input.txt";
void main() async {
  RegExp exp = RegExp(r'(\d{1})');
  File(fileUri)
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
