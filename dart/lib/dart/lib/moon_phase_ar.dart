/// Moon phase calculator with Arabic phase names.
///
/// Uses a simple synodic-month approximation. Reference new moon:
/// 2000-01-06 18:14 UTC. Results are indicative and may differ from precise
/// astronomical ephemerides by a day or more for some dates.
library moon_phase_ar;

import 'dart:math' as math;

/// Mean length of the synodic month in days.
const double synodicMonth = 29.530588853;

final int _refNewMoonMs =
    DateTime.utc(2000, 1, 6, 18, 14).millisecondsSinceEpoch;

/// One of the eight moon phases with its Arabic and English names.
class MoonPhaseName {
  const MoonPhaseName(this.key, this.ar, this.en);
  final String key;
  final String ar;
  final String en;
}

/// The eight phases in lunar order, starting at the new moon.
const List<MoonPhaseName> phases = [
  MoonPhaseName('new', 'محاق', 'New Moon'),
  MoonPhaseName('waxing_crescent', 'هلال متزايد', 'Waxing Crescent'),
  MoonPhaseName('first_quarter', 'تربيع أول', 'First Quarter'),
  MoonPhaseName('waxing_gibbous', 'أحدب متزايد', 'Waxing Gibbous'),
  MoonPhaseName('full', 'بدر', 'Full Moon'),
  MoonPhaseName('waning_gibbous', 'أحدب متناقص', 'Waning Gibbous'),
  MoonPhaseName('last_quarter', 'تربيع أخير', 'Last Quarter'),
  MoonPhaseName('waning_crescent', 'هلال متناقص', 'Waning Crescent'),
];

/// Result of [getMoonPhase].
class MoonPhaseResult {
  const MoonPhaseResult({
    required this.age,
    required this.illumination,
    required this.phase,
    required this.phaseAr,
    required this.phaseEn,
  });

  /// Moon age in days since the last new moon, rounded to one decimal.
  final double age;

  /// Illuminated fraction in percent, rounded to one decimal.
  final double illumination;
  final String phase;
  final String phaseAr;
  final String phaseEn;

  @override
  String toString() =>
      'MoonPhaseResult(age: $age, illumination: $illumination, phase: $phase, phaseAr: $phaseAr)';
}

/// Moon age in days (0 <= age < [synodicMonth]) for [date].
double moonAge(DateTime date) {
  final days = (date.toUtc().millisecondsSinceEpoch - _refNewMoonMs) / 86400000;
  return ((days % synodicMonth) + synodicMonth) % synodicMonth;
}

/// Full phase information for [date].
MoonPhaseResult getMoonPhase(DateTime date) {
  final age = moonAge(date);
  final frac = age / synodicMonth;
  final illumination =
      (((1 - math.cos(2 * math.pi * frac)) / 2) * 1000).round() / 10;
  final idx = (((frac + 1 / 16) % 1) * 8).floor();
  final p = phases[idx];
  return MoonPhaseResult(
    age: (age * 10).round() / 10,
    illumination: illumination,
    phase: p.key,
    phaseAr: p.ar,
    phaseEn: p.en,
  );
}
