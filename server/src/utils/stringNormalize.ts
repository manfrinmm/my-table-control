export default function stringNormalize(string: string) {
  return string
    .trim()
    .toLowerCase()
    .split(" ")
    .map((word) => word[0]?.toUpperCase() + word?.slice(1))
    .join(" ");
}
