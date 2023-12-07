import "../aoc.dart" as aoc;

var digitExp = RegExp(r"(\d+)");

List<int> getIntList(String line) {
  return digitExp.allMatches(line).map((e) => int.parse(e.group(0)!)).toList();
}

Map<String, List<List<int>>> almanac = Map();

void main() async {
  List<int> seeds = [];
  var location = 100000000000; //some big number to initilaize;
  var inputFile = await aoc.getInputFileForDay(5);
  await inputFile.readAsLines().then((input) {
    var mapName = "";
    input.forEach((line) {
      if (line.startsWith("seeds:")) {
        seeds = getIntList(line);
      } else if (line.contains("map:")) {
        mapName = line.replaceAll("map:", "").trim();
        almanac[mapName] = [];
      } else if (digitExp.hasMatch(line)) {
        almanac[mapName]!.add(getIntList(line));
      }
    });
  });
  seeds.forEach(
    (seed) {
      var source = seed;
      almanac.forEach((name, maps) {
        for (var map in maps) {
          var [destinationStart, sourceStart, length] = map;
          if (source >= sourceStart && source < sourceStart + length) {
            source = source + (destinationStart - sourceStart);
            break;
          }
        }
      });
      location = location > source ? source : location;
    },
  );
  print(location);
}
