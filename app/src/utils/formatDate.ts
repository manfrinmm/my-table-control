import { format, parseISO } from "date-fns";

export default function formatDate(date: string, time?: boolean): string {
  if (!date) {
    return "-";
  }

  const only_date = !date.includes("T");

  if (time) {
    return format(parseISO(date), "HH':'mm':'ss");
  }

  if (only_date) {
    return format(parseISO(date), "dd/MM/yyyy");
  }

  return format(parseISO(date), "dd/MM/yyyy 'às' HH':'mm':'ss");
}
