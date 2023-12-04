import "../aoc.dart" as aoc;

var gameSum = 0;
void main() async {
  var inputFile = await aoc.getInputFileForDay(2);
  inputFile.readAsLines().then((lines) => lines.forEach((game) {
        var sections = game.split(":");
        int redLimit = 1;
        int greenLimit = 1;
        int blueLimit = 1;
        sections[1].split(";").forEach((draw) {
          draw.split(",").forEach((_set) {
            var result = _set.trim().split(" ");
            var amount = int.parse(result[0]);
            var color = result[1];
            if (color == 'red' && amount > redLimit) {
              redLimit = amount;
            }
            if (color == 'blue' && amount > blueLimit) {
              blueLimit = amount;
            }
            if (color == 'green' && amount > greenLimit) {
              greenLimit = amount;
            }
          });
        });
        var power = redLimit * greenLimit * blueLimit;
        // print([power, redLimit, greenLimit, blueLimit]);
        gameSum += power;
      }));
  print(gameSum);
}
