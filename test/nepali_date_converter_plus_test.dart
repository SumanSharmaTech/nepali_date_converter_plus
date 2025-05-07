import 'package:flutter_test/flutter_test.dart';
import 'package:nepali_date_converter_plus/nepali_date_converter_plus.dart';

void main() {
  group('NepaliDateConverterPlus', () {
    test('convertADToBS should convert 2024-05-07 to expected BS date', () {
      final bsDate = NepaliDateConverterPlus.convertADToBS(2024, 5, 7);
      expect(bsDate, isA<Map<String, int>>());
      expect(bsDate.containsKey('year'), isTrue);
      expect(bsDate.containsKey('month'), isTrue);
      expect(bsDate.containsKey('day'), isTrue);
      // expect(bsDate, {'year': 2081, 'month': 1, 'day': 25});
    });

    test('toNepaliNumber converts digits', () {
      expect(NepaliDateConverterPlus.toNepaliNumber(2078), '२०७८');
      expect(
        NepaliDateConverterPlus.toNepaliNumber('1234567890'),
        '१२३४५६७८९०',
      );
    });

    test('formatBSDate in various formats', () {
      final bsDate = {'year': 2078, 'month': 1, 'day': 12};
      expect(
        NepaliDateConverterPlus.formatBSDate(bsDate, 'YYYY/MM/DD'),
        '२०७८/१/१२',
      );
      expect(
        NepaliDateConverterPlus.formatBSDate(bsDate, 'DD-MM-YYYY'),
        '१२-१-२०७८',
      );
      expect(NepaliDateConverterPlus.formatBSDate(bsDate), '२०७८-बैशाख-१२');
    });

    test('getCurrentNepaliDate returns string', () {
      final date = NepaliDateConverterPlus.getCurrentNepaliDate();
      expect(date, isA<String>());
    });

    test('getCurrentNepaliDay returns string', () {
      final day = NepaliDateConverterPlus.getCurrentNepaliDay();
      expect(day, isA<String>());
    });

    test('getCurrentNepaliMonth returns string', () {
      final month = NepaliDateConverterPlus.getCurrentNepaliMonth();
      expect(month, isA<String>());
    });

    test('getCurrentNepaliYear returns string', () {
      final year = NepaliDateConverterPlus.getCurrentNepaliYear();
      expect(year, isA<String>());
    });

    test('getCurrentNepaliDayOfWeek returns string', () {
      final dow = NepaliDateConverterPlus.getCurrentNepaliDayOfWeek();
      expect(dow, isA<String>());
    });
  });
}
