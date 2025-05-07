/// Date Converter module for Nepali Date Converter Plus
/// Contains functions for converting between Gregorian (AD) and Bikram Sambat (BS) dates.
library;

import 'conversion_data.dart';
import 'utils.dart';

/// A class that handles date conversion between Gregorian (AD) and Bikram Sambat (BS) calendars.
class DateConverter {
  /// Converts an AD (Gregorian) date to Nepali (BS) date.
  ///
  /// @param year The Gregorian year
  /// @param month The Gregorian month (1-12)
  /// @param day The Gregorian day (1-31)
  /// @return A Map with 'year', 'month', 'day' keys containing BS values
  static Map<String, int> convertADToBS(int year, int month, int day) {
    // Initialize with reference date
    int npYear = ReferenceDate.startingNepYear;
    int npMonth = ReferenceDate.startingNepMonth;
    int npDay = ReferenceDate.startingNepDay;
    int totalDays = 0;

    // Calculate total days from reference year to the given year
    for (int i = ReferenceDate.startingEngYear; i < year; i++) {
      totalDays += isLeapYear(i) ? 366 : 365;
    }

    // Add days for the given year up to the given month
    for (int i = ReferenceDate.startingEngMonth; i < month; i++) {
      totalDays += gregorianMonths[i - 1];
      if (isLeapYear(year) && i == 2) totalDays += 1;
    }

    // Add the given day, adjusting for the reference day
    totalDays += day - ReferenceDate.startingEngDay;

    // Iterate through Nepali months/years to find the Nepali date
    int yearIndex = 0, monthIndex = ReferenceDate.startingNepMonth - 1;
    while (totalDays > 0) {
      if (yearIndex >= nepaliMonths.length) {
        throw Exception(
          "Nepali months data is insufficient for the given year.",
        );
      }
      int daysInMonth = nepaliMonths[yearIndex][monthIndex];
      npDay++;
      if (npDay > daysInMonth) {
        monthIndex++;
        npDay = 1;
        npMonth++;
      }
      if (npMonth > 12) {
        npYear++;
        npMonth = 1;
      }
      if (monthIndex > 11) {
        yearIndex++;
        monthIndex = 0;
      }
      totalDays--;
    }
    return {'year': npYear, 'month': npMonth, 'day': npDay};
  }

  /// Converts a BS (Nepali) date to AD (Gregorian) date.
  ///
  /// Note: This method needs to be implemented.
  ///
  /// @param year The Nepali year (BS)
  /// @param month The Nepali month (1-12)
  /// @param day The Nepali day (1-32, depending on the month)
  /// @return A Map with 'year', 'month', 'day' keys containing AD values
  static Map<String, int> convertBSToAD(int year, int month, int day) {
    // TODO: Implement BS to AD conversion
    throw UnimplementedError('BS to AD conversion is not yet implemented');
  }
}
