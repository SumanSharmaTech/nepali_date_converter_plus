/// Nepali Date Converter Plus implementation
/// This class provides static methods that wrap the functionality of the individual classes.
library;

import 'date_converter.dart';
import 'formatter.dart';
import 'nepali_date.dart';
import 'utils.dart' as utils;

/// A static utility class for working with Nepali dates (Bikram Sambat).
///
/// This class wraps the functionality of individual components in simpler,
/// more convenient static methods.
class NepaliDateConverterPlus {
  /// Converts an AD (Gregorian) date to Nepali (BS) date.
  ///
  /// @param year The Gregorian year
  /// @param month The Gregorian month (1-12)
  /// @param day The Gregorian day (1-31)
  /// @return A Map with 'year', 'month', 'day' keys containing BS values
  static Map<String, int> convertADToBS(int year, int month, int day) {
    return DateConverter.convertADToBS(year, month, day);
  }

  /// Converts a BS (Nepali) date to AD (Gregorian) date.
  ///
  /// @param year The Nepali year (BS)
  /// @param month The Nepali month (1-12)
  /// @param day The Nepali day (1-32, depending on the month)
  /// @return A Map with 'year', 'month', 'day' keys containing AD values
  static Map<String, int> convertBSToAD(int year, int month, int day) {
    return DateConverter.convertBSToAD(year, month, day);
  }

  /// Converts Arabic numerals to Nepali numerals.
  ///
  /// @param number The input number or string to convert
  /// @return A string containing Nepali numerals
  static String toNepaliNumber(dynamic number) {
    return utils.toNepaliNumber(number);
  }

  /// Formats a Nepali date as a String in the specified format.
  ///
  /// @param date A Map containing 'year', 'month', and 'day' keys with their respective values
  /// @param format The desired output format (optional, defaults to 'YYYY-MMMM-DD')
  /// @return A formatted string representing the Nepali date
  static String formatBSDate(Map<String, int> date,
      [String format = 'YYYY-MMMM-DD']) {
    return DateFormatter.formatBSDate(date, format);
  }

  /// Gets the current Nepali date as a formatted string.
  ///
  /// @return Today's date in Nepali BS calendar as a formatted string
  static String getCurrentNepaliDate([String format = 'YYYY-MM-DD']) {
    final nepaliDate = NepaliDate.today();
    return nepaliDate.format(format);
  }

  /// Gets the current Nepali day of the month as a string with Nepali numerals.
  ///
  /// @return Current day of month in Nepali numerals
  static String getCurrentNepaliDay() {
    final nepaliDate = NepaliDate.today();
    return utils.toNepaliNumber(nepaliDate.day);
  }

  /// Gets the current Nepali month as its name string.
  ///
  /// @return Current month name in Nepali
  static String getCurrentNepaliMonth() {
    final nepaliDate = NepaliDate.today();
    return nepaliDate.monthName;
  }

  /// Gets the current Nepali year as a string with Nepali numerals.
  ///
  /// @return Current year in Nepali numerals
  static String getCurrentNepaliYear() {
    final nepaliDate = NepaliDate.today();
    return utils.toNepaliNumber(nepaliDate.year);
  }

  /// Gets the current day of week in Nepali.
  ///
  /// @return Name of current day of week in Nepali
  static String getCurrentNepaliDayOfWeek() {
    final nepaliDate = NepaliDate.today();
    return nepaliDate.dayName;
  }
}
