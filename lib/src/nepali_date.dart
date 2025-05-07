/// Nepali Date class for Nepali Date Converter Plus
/// Provides an object-oriented way to work with Nepali dates.
library;

import 'conversion_data.dart';
import 'date_converter.dart';
import 'formatter.dart';

/// A class representing a Nepali date (BS) with various utility methods.
///
/// This class makes it easier to work with Nepali dates in an object-oriented way,
/// providing methods for comparisons, calculations, and formatting.
class NepaliDate {
  /// The Nepali year in BS.
  final int year;

  /// The Nepali month (1-12).
  final int month;

  /// The Nepali day of the month.
  final int day;

  /// Creates a new NepaliDate instance.
  ///
  /// @param year The Nepali year in BS
  /// @param month The Nepali month (1-12)
  /// @param day The Nepali day
  NepaliDate({
    required this.year,
    required this.month,
    required this.day,
  });

  /// Creates a NepaliDate instance from a DateTime (Gregorian/AD) object.
  ///
  /// @param dateTime A DateTime object to convert to NepaliDate
  /// @return A new NepaliDate instance
  factory NepaliDate.fromDateTime(DateTime dateTime) {
    final bsDate = DateConverter.convertADToBS(
      dateTime.year,
      dateTime.month,
      dateTime.day,
    );
    return NepaliDate(
      year: bsDate['year']!,
      month: bsDate['month']!,
      day: bsDate['day']!,
    );
  }

  /// Creates a NepaliDate instance representing the current date.
  ///
  /// @return A new NepaliDate instance for today's date
  factory NepaliDate.today() {
    return NepaliDate.fromDateTime(DateTime.now());
  }

  /// Formats this Nepali date according to the specified format.
  ///
  /// @param format The desired format (see DateFormatter.formatBSDate for options)
  /// @return A formatted string representing this Nepali date
  String format([String format = 'YYYY-MMMM-DD']) {
    return DateFormatter.formatBSDate(
      {'year': year, 'month': month, 'day': day},
      format,
    );
  }

  /// Returns the Nepali month name for this date.
  ///
  /// @return The full Nepali month name
  String get monthName => nepaliMonthNames[month - 1];

  /// Returns the Nepali day of week (0-6, where 0 is Sunday).
  ///
  /// Note: This is a placeholder. Proper implementation would require
  /// calculating the actual day of week.
  ///
  /// @return The day of week as an integer (0-6)
  int get weekDay {
    // TODO: Implement proper day of week calculation
    return 0; // Placeholder
  }

  /// Returns the name of the day of week in Nepali.
  ///
  /// @return The Nepali name of the day of week
  String get dayName => nepaliDayNames[weekDay];

  /// Converts this Nepali date to a Map representation.
  ///
  /// @return A Map with 'year', 'month', and 'day' keys
  Map<String, int> toMap() {
    return {
      'year': year,
      'month': month,
      'day': day,
    };
  }

  @override
  String toString() {
    return format('YYYY-MM-DD');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NepaliDate &&
        other.year == year &&
        other.month == month &&
        other.day == day;
  }

  @override
  int get hashCode => Object.hash(year, month, day);
}
