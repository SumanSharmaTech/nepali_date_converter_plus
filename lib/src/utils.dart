/// Utility functions for Nepali Date Converter Plus
/// Contains helper functions used across the package.
library;

import 'conversion_data.dart';

/// Checks if a given Gregorian year is a leap year.
///
/// According to the Gregorian calendar, a leap year occurs:
/// - Every 4 years, except for years that are divisible by 100
/// - Unless the year is also divisible by 400
///
/// @param year The Gregorian year to check
/// @return true if the year is a leap year, false otherwise
bool isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

/// Converts Arabic numerals to Nepali numerals.
///
/// This function takes any value (number or string containing numbers),
/// converts it to a string, and replaces each digit with its Nepali equivalent.
///
/// @param number The input number or string to convert
/// @return A string containing Nepali numerals
String toNepaliNumber(dynamic number) {
  return number
      .toString()
      .split('')
      .map((digit) => englishToNepaliNumbers[digit] ?? digit)
      .join();
}
