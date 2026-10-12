/**
 * Helper to safely parse dates in various formats (DD/MM/YYYY, YYYY-MM-DD, or ISO strings)
 */
export const parseSafeDate = (d) => {
  if (!d) return null;
  if (d instanceof Date) return isNaN(d.getTime()) ? null : d;
  if (typeof d === "string" && d.includes("/")) {
    const parts = d.split("/");
    if (parts.length === 3) {
      const day = parseInt(parts[0], 10);
      const month = parseInt(parts[1], 10) - 1;
      const year = parseInt(parts[2], 10);
      const parsed = new Date(year, month, day);
      if (!isNaN(parsed.getTime())) return parsed;
    }
  }
  const parsed = new Date(d);
  return isNaN(parsed.getTime()) ? null : parsed;
};
