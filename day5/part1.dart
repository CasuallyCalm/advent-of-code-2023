import "dart:io";

var digitExp = RegExp(r"(\d+)");

List<int> getIntList(String line) {
  return digitExp.allMatches(line).map((e) => int.parse(e.group(0)!)).toList();
}

void main() async {
  List<int> seeds = [];
  List<List<int>> maps = [];
  var location = -1;
  var inputFile = File("./day5/testinput.txt");
  await inputFile.readAsLines().then((input) => {
        input.forEach((line) {
          if (line.startsWith("seeds:")) {
            seeds = getIntList(line);
          } else if (digitExp.hasMatch(line)) {
            maps.add(getIntList(line));
          }
        })
      });
  seeds.forEach(
    (seed) {
      maps.forEach((map) {
        var [destination, source, length] = map;
        if (source <= seed && seed <= source + length - 1) {
          seed = seed + destination - source;
        }
        if (destination <= seed && seed <= destination + length - 1) {
          seed = seed + destination - source;
        }
        print(seed);
      });
      // if (location == -1 | location > value) {
      //   location = value;
      // }
    },
  );
  print(location);
}
