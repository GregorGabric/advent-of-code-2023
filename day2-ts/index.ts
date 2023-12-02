// 12 red cubes, 13 green cubes, and 14 blue cubes
const MAX_CUBES = {
  red: 12,
  green: 13,
  blue: 14,
};

const file = Deno.readTextFileSync("input.txt");
type PossibleColor = "red" | "green" | "blue";

const matchColor = (line: string, color: PossibleColor) => {
  const regex = new RegExp(`\\d+(?= ${color})`, "g");
  return line.match(regex)?.map(Number);
};

const passesColor = (
  arrOfNums: ReturnType<typeof matchColor>,
  maxValue: number
) => arrOfNums?.every((num) => num <= maxValue);
let sum_1 = 0;

file.split("\n").forEach((line) => {
  const bluePass = passesColor(matchColor(line, "blue"), MAX_CUBES.blue);
  const greenPass = passesColor(matchColor(line, "green"), MAX_CUBES.green);
  const redPass = passesColor(matchColor(line, "red"), MAX_CUBES.red);

  if (bluePass && greenPass && redPass) {
    const gameId = line.split(":")[0].split(" ")[1];
    sum_1 += Number(gameId);
  }
});

// PART 2

const getMinimumCubes = (arrOfNums: ReturnType<typeof matchColor>) =>
  Math.max(...arrOfNums!);

let sum_2 = 0;

file.split("\n").forEach((line) => {
  const blueMinimum = getMinimumCubes(matchColor(line, "blue"));
  const greenMinimum = getMinimumCubes(matchColor(line, "green"));
  const redMinimum = getMinimumCubes(matchColor(line, "red"));

  sum_2 += blueMinimum * greenMinimum * redMinimum;
  console.log({
    blueMinimum,
    greenMinimum,
    redMinimum,
  });
});
