import "../aoc.dart" as aoc;

final partExp = RegExp(r"(\d+)", multiLine: false);
final symbolExp = RegExp(r"([^.\s\d])", multiLine: true);
int partSum = 0;
int lineLength = 0;

List<int> boundingBox(RegExpMatch partNumber) {
  List<int> values = [];
  var start = partNumber.start;
  var end = partNumber.end - 1;
  values.addAll([
    start - 1,
    start - lineLength - 1,
    start + lineLength - 1,
    end + 1,
    end - lineLength + 1,
    end + lineLength + 1
  ]);
  for (var i = start; i <= end; i++) {
    values.add(i + lineLength);
    values.add(i - lineLength);
  }
  return values;
}

void main() async {
  var inputFile = aoc.getInputFileForDay(3);
  List<int> symbolLocations = [];
  await inputFile.readAsLines().then((lines) => lineLength = lines[0].length +
      1); // the test input needed length +2 for some reason...
  await inputFile.readAsString().then((input) {
    input = input.trim();
    symbolExp.allMatches(input).forEach((match) {
      symbolLocations.add(match.start);
    });
    partExp.allMatches(input).forEach((match) {
      boundingBox(match).forEach((position) {
        if (symbolLocations.contains(position)) {
          var partNum = int.parse(match.group(0)!);
          partSum += partNum;
        }
      });
    });
  });
  print(partSum);
}
