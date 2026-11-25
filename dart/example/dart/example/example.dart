import 'package:moon_phase_ar/moon_phase_ar.dart';

void main() {
  final r = getMoonPhase(DateTime.utc(2026, 11, 25));
  print(
      '${r.phaseAr} (${r.phaseEn}), age ${r.age} days, ${r.illumination}% lit');
}
