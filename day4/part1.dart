import "../aoc.dart" as aoc;

int total = 0;

void main() async {
  var inputFile = await aoc.getInputFileForDay(4);
  await inputFile.readAsLines().then((lines) {
    lines.forEach((line) {
      line = line.replaceAll(RegExp(r"\s+"), " ");
      var cardTotal = 0;
      var [_, numbers] = line.split(":");
      var [winningS, myNumbersS] = numbers.split("|");
      var winning =
          winningS.trim().split(" ").map((e) => int.parse(e)).toList();
      var myNumbers =
          myNumbersS.trim().split(" ").map((e) => int.parse(e)).toList();
      myNumbers.forEach((n) {
        if (winning.contains(n)) {
          if (cardTotal == 0) {
            cardTotal = 1;
          } else {
            cardTotal += cardTotal;
          }
        }
      });
      total += cardTotal;
    });
  });
  print(total);
}
