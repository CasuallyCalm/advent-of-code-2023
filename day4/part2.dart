import "../aoc.dart" as aoc;

Map<int, int> totalCards = Map<int, int>();
int cardSum = 0;
void addCardInstances() {}
void main() async {
  var inputFile = await aoc.getInputFileForDay(4);
  await inputFile.readAsLines().then((lines) {
    lines.forEach((line) {
      line = line.replaceAll(RegExp(r"\s+"), " ");
      var cardMatches = 0;
      var [cardString, numbers] = line.split(":");
      int card = int.parse(cardString.replaceAll("Card ", ""));
      totalCards.putIfAbsent(card, () => 0);
      totalCards[card] = totalCards[card]! + 1;
      var [winningS, myNumbersS] = numbers.split("|");
      var winning =
          winningS.trim().split(" ").map((e) => int.parse(e)).toList();
      var myNumbers =
          myNumbersS.trim().split(" ").map((e) => int.parse(e)).toList();
      myNumbers.forEach((n) {
        if (winning.contains(n)) {
          cardMatches += 1;
        }
      });
      for (int i = card + 1; i <= card + cardMatches; i++) {
        totalCards.putIfAbsent(i, () => 0);
        totalCards[i] = totalCards[i]! + totalCards[card]!;
      }
    });
  });
  totalCards.forEach((key, value) {
    cardSum += value;
  });
  print(cardSum);
}
