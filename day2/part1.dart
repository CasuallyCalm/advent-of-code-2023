import "dart:io";

final String inputPath = "./day2/input.txt";
var gameSum = 0;
final int redLimit = 12;
final int greenLimit = 13;
final int blueLimit = 14;
void main() async {
  await File(inputPath).readAsLines().then((lines) => lines.forEach((game) {
        bool possible = true;
        var sections = game.split(":");
        var gameNumber = sections[0].substring(5).trim();
        sections[1].split(";").forEach((draw) {
          draw.split(",").forEach((_set) {
            var result = _set.trim().split(" ");
            var amount = int.parse(result[0]);
            var color = result[1];
            if (color == 'red' && amount > redLimit) {
              possible = false;
            }
            if (color == 'blue' && amount > blueLimit) {
              possible = false;
            }
            if (color == 'green' && amount > greenLimit) {
              possible = false;
            }
          });
        });
        if (possible) {
          gameSum += int.parse(gameNumber);
        }
      }));
  print(gameSum);
}
