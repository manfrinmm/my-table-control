export default function slugify(
  string: string,
  separator = " ",
  capitalize = false,
) {
  var stringFormatted = string
    .toString()
    .normalize("NFD") // split an accented letter in the base letter and the accent
    .replace(/[\u0300-\u036f]/g, "") // remove all previously split accents
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9 ]/g, "") // remove all chars not letters, numbers and spaces (to be replaced)
    .replace(/\s+/g, separator);

  if (capitalize) {
    stringFormatted = stringFormatted
      .split(" ")
      .map((word) => word[0].toUpperCase() + word.slice(1))
      .join(" ");
  }

  return stringFormatted;
}
