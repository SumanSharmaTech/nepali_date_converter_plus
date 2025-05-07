# Nepali Date Converter Plus

A comprehensive Dart package for working with Nepali dates (Bikram Sambat). This package provides tools for converting between Gregorian (AD) and Nepali (BS) dates, formatting Nepali dates, and working with Nepali dates in an object-oriented way.

[![Pub Version](https://img.shields.io/pub/v/nepali_date_converter_plus.svg)](https://pub.dev/packages/nepali_date_converter_plus)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

- 📅 Convert dates between Gregorian (AD) and Nepali (BS) calendars
- 🔄 Easy-to-use object-oriented API with `NepaliDate` class
- 📝 Multiple date formatting options with both predefined and custom formats
- 🔢 Support for Nepali numerals (१, २, ३, etc.)
- 📋 Access to Nepali month names and day names
- ⚡ Lightweight and efficient implementation

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  nepali_date_converter_plus: ^0.0.1 # Use the latest version
```

Run the following command to install:

```bash
flutter pub get
```

Import the package in your Dart code:

```dart
import 'package:nepali_date_converter_plus/nepali_date_converter_plus.dart';
```

## Usage

### Convert AD to BS (Gregorian to Nepali)

```dart
// Convert an AD date to BS date
Map<String, int> bsDate = DateConverter.convertADToBS(2023, 5, 15);
print(bsDate); // {'year': 2080, 'month': 2, 'day': 1} (example output)
```

### Create a NepaliDate Object

```dart
// Create a NepaliDate from year, month, day
NepaliDate nepaliDate = NepaliDate(year: 2080, month: 2, day: 1);

// Create a NepaliDate from a Dart DateTime object
NepaliDate todayInBS = NepaliDate.fromDateTime(DateTime.now());

// Get today's date in Nepali calendar
NepaliDate today = NepaliDate.today();
```

### Format Nepali Dates

```dart
NepaliDate today = NepaliDate.today();

// Default format (YYYY-MMMM-DD)
String formatted = today.format();
print(formatted); // Example: २०८०-जेठ-१

// Different predefined formats
print(today.format('YYYY/MM/DD')); // Example: २०८०/०२/०१
print(today.format('DD-MM-YYYY')); // Example: ०१-०२-२०८०

// Custom format using DateFormatter
Map<String, int> date = {'year': 2080, 'month': 2, 'day': 1};
String custom = DateFormatter.customFormat(date, 'YYYY साल MMMM महिना DD गते');
print(custom); // Example: २०८० साल जेठ महिना ०१ गते
```

### Access Nepali Month and Day Names

```dart
// Get Nepali month names
print(nepaliMonthNames); // List of all Nepali month names

// Get the current month name
NepaliDate today = NepaliDate.today();
print(today.monthName); // Current month name in Nepali
```

### Convert Numerals to Nepali

```dart
String nepaliNumber = toNepaliNumber(2023);
print(nepaliNumber); // २०२३
```

## Example

```dart
import 'package:nepali_date_converter_plus/nepali_date_converter_plus.dart';

void main() {
  // Get today's date in Nepali calendar
  NepaliDate today = NepaliDate.today();

  // Format and display the date
  print('Today in Nepali Calendar:');
  print(today.format()); // Default format: YYYY-MMMM-DD

  // Use custom formatting
  print(today.format('YYYY/MM/DD'));

  // Advanced custom formatting
  Map<String, int> dateMap = today.toMap();
  String custom = DateFormatter.customFormat(
    dateMap,
    'आज नेपाली संवत YYYY साल MMMM महिना DD गते हो।'
  );
  print(custom);
}
```

## Additional information

### Version Support

This package works with both Flutter and standalone Dart projects.

### Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to create an issue or submit a pull request on the GitHub repository.

GitHub: [https://github.com/SumanSharmaTech/nepali_date_converter_plus](https://github.com/SumanSharmaTech/nepali_date_converter_plus)

### License

This package is released under the MIT License.
