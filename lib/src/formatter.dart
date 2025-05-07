/// Date formatting module for Nepali Date Converter Plus
/// Contains functions for formatting BS dates in various formats.
library;

import 'conversion_data.dart';
import 'utils.dart';

/// A class that handles formatting of Nepali (BS) dates in various formats.
class DateFormatter {
  /// Formats a Nepali date as a String in the specified format.
  ///
  /// Supported formats include:
  /// - 'YYYY/MM/DD': Year/Month/Day with Nepali numerals
  /// - 'YYYY-MM-DD': Year-Month-Day with Nepali numerals
  /// - 'YYYY MM DD': Year Month Day with Nepali numerals
  /// - 'DD/MM/YYYY': Day/Month/Year with Nepali numerals
  /// - 'DD-MM-YYYY': Day-Month-Year with Nepali numerals
  /// - 'DD MM YYYY': Day Month Year with Nepali numerals
  /// - 'YYYY-MMMM-DD': Year-MonthName-Day, default format if none specified
  ///
  /// @param date A Map containing 'year', 'month', and 'day' keys with their respective values
  /// @param format The desired output format (optional, defaults to 'YYYY-MMMM-DD')
  /// @return A formatted string representing the Nepali date
  static String formatBSDate(
    Map<String, int> date, [
    String format = 'YYYY-MMMM-DD',
  ]) {
    int year = date['year']!;
    int month = date['month']!;
    int day = date['day']!;
    String nepaliYear = toNepaliNumber(year);
    String nepaliMonth = nepaliMonthNames[month - 1];
    String nepaliDay = toNepaliNumber(day);

    switch (format) {
      case 'YYYY/MM/DD':
        return '$nepaliYear/${toNepaliNumber(month)}/$nepaliDay';
      case 'YYYY-MM-DD':
        return '$nepaliYear-${toNepaliNumber(month)}-$nepaliDay';
      case 'YYYY MM DD':
        return '$nepaliYear ${toNepaliNumber(month)} $nepaliDay';
      case 'DD/MM/YYYY':
        return '$nepaliDay/${toNepaliNumber(month)}/$nepaliYear';
      case 'DD-MM-YYYY':
        return '$nepaliDay-${toNepaliNumber(month)}-$nepaliYear';
      case 'DD MM YYYY':
        return '$nepaliDay ${toNepaliNumber(month)} $nepaliYear';
      case 'YYYY-MMMM-DD':
        return '$nepaliYear-$nepaliMonth-$nepaliDay';
      default:
        return '$nepaliYear-$nepaliMonth-$nepaliDay';
    }
  }

  /// Formats a date with a custom format string.
  ///
  /// This is a more flexible formatting option that allows custom patterns.
  /// Placeholders that will be replaced:
  /// - 'YYYY': Nepali year in Nepali numerals
  /// - 'MM': Nepali month in Nepali numerals
  /// - 'DD': Nepali day in Nepali numerals
  /// - 'MMMM': Full Nepali month name
  ///
  /// @param date A Map containing 'year', 'month', and 'day' keys with their respective values
  /// @param formatString The custom format string with placeholders
  /// @return A formatted string representing the Nepali date
  static String customFormat(Map<String, int> date, String formatString) {
    int year = date['year']!;
    int month = date['month']!;
    int day = date['day']!;

    String result = formatString;
    result = result.replaceAll('YYYY', toNepaliNumber(year));
    result = result.replaceAll('MM', toNepaliNumber(month));
    result = result.replaceAll('DD', toNepaliNumber(day));
    result = result.replaceAll('MMMM', nepaliMonthNames[month - 1]);

    return result;
  }
}
