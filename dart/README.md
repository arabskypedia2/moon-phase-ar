# moon_phase_ar

حاسبة طور القمر بالعربية: اسم الطور بالعربية والإنجليزية، عمر القمر بالأيام، ونسبة الإضاءة لأي تاريخ.

A small Dart moon phase calculator with Arabic phase names: phase, moon age in days and illumination for any date. A port of the [moon-phase-ar](https://www.npmjs.com/package/moon-phase-ar) npm package.

Maintained by [ArabSkyPedia](https://arabskypedia.com/) (موسوعة السماء العربية), a free Arabic astronomy reference. The site also has free [online astronomy tools](https://arabskypedia.com/tools/).

## Usage

```dart
import 'package:moon_phase_ar/moon_phase_ar.dart';

void main() {
  final r = getMoonPhase(DateTime.utc(2026, 11, 25));
  print(r.phaseAr);       // بدر
  print(r.phaseEn);       // Full Moon
  print(r.age);           // moon age in days
  print(r.illumination);  // percent lit
}
```

## Phases

| key | العربية | English |
| --- | --- | --- |
| `new` | محاق | New Moon |
| `waxing_crescent` | هلال متزايد | Waxing Crescent |
| `first_quarter` | تربيع أول | First Quarter |
| `waxing_gibbous` | أحدب متزايد | Waxing Gibbous |
| `full` | بدر | Full Moon |
| `waning_gibbous` | أحدب متناقص | Waning Gibbous |
| `last_quarter` | تربيع أخير | Last Quarter |
| `waning_crescent` | هلال متناقص | Waning Crescent |

## Accuracy

This is a mean-phase approximation, not an ephemeris. It counts days from a reference new moon (2000-01-06 18:14 UTC) in steps of the mean synodic month (29.530588853 days). The real moon speeds up and slows down, so actual new and full moons drift from this model.

Measured against PyEphem 4.2.1 event times for the 30 new and 30 full moons between 18 January 2026 and 7 June 2028, the model's age was off by 0.72 days at most (mean about 0.29 days). Near a new or full moon the reported phase name and illumination can therefore be wrong by a day. Phase names are the nearest eighth of the cycle, so each name covers about 3.7 days, not an exact quarter. Do not use it for sighting, prayer or fasting decisions. Use an ephemeris for that.

The tests only check that the model stays within one day of those PyEphem times. They do not prove ephemeris-grade precision.

## API

- `getMoonPhase(DateTime)` returns a `MoonPhaseResult`.
- `moonAge(DateTime)` returns the age in days.
- `phases` lists the eight phases.

## License

MIT
