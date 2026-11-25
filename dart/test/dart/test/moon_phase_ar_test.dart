import 'package:moon_phase_ar/moon_phase_ar.dart';
import 'package:test/test.dart';

// Event times (UTC) computed with PyEphem 4.2.1 (ephem.next_new_moon and
// ephem.next_full_moon). The model is a mean-phase approximation, so it is
// only expected to land within one day of them.
final newMoons = [
  DateTime.utc(2026, 1, 18, 19, 51),
  DateTime.utc(2026, 5, 16, 20, 1),
  DateTime.utc(2026, 9, 11, 3, 27),
  DateTime.utc(2026, 11, 9, 7, 2),
  DateTime.utc(2027, 3, 8, 9, 29),
];
final fullMoons = [
  DateTime.utc(2026, 1, 3, 10, 3),
  DateTime.utc(2026, 5, 1, 17, 23),
  DateTime.utc(2026, 9, 26, 16, 49),
  DateTime.utc(2026, 11, 24, 14, 53),
  DateTime.utc(2027, 3, 22, 10, 44),
];

double offsetFrom(double age, double target) {
  var d = age - target;
  if (d > synodicMonth / 2) d -= synodicMonth;
  if (d < -synodicMonth / 2) d += synodicMonth;
  return d.abs();
}

void main() {
  test('model age is within 1 day of PyEphem new moons', () {
    for (final t in newMoons) {
      expect(offsetFrom(moonAge(t), 0), lessThan(1.0), reason: '$t');
    }
  });
  test('model age is within 1 day of PyEphem full moons', () {
    for (final t in fullMoons) {
      expect(offsetFrom(moonAge(t), synodicMonth / 2), lessThan(1.0),
          reason: '$t');
    }
  });
  test('new and full moon dates get new/full names', () {
    expect(getMoonPhase(DateTime.utc(2026, 11, 9, 7, 2)).phase, 'new');
    expect(getMoonPhase(DateTime.utc(2026, 11, 24, 14, 53)).phaseAr, 'بدر');
  });
  test('age stays in [0, synodicMonth)', () {
    for (final y in [1950, 2026, 2099]) {
      final a = moonAge(DateTime.utc(y, 6, 15));
      expect(a, greaterThanOrEqualTo(0));
      expect(a, lessThan(synodicMonth));
    }
  });
  test('local and utc input agree', () {
    final a = getMoonPhase(DateTime.utc(2026, 11, 25, 12));
    final b = getMoonPhase(DateTime.utc(2026, 11, 25, 12).toLocal());
    expect(a.age, b.age);
  });
}
