# moon-phase-ar

A small JavaScript library that returns the moon phase for any date, with Arabic and English phase names, the moon's age in days and the illuminated percentage.

مكتبة JavaScript صغيرة تعيد طور القمر لأي تاريخ: الاسم بالعربية والإنجليزية، وعمر القمر بالأيام، ونسبة الإضاءة.

## Install

```bash
npm install moon-phase-ar
```

## Use

```js
const { getMoonPhase, moonAge } = require('moon-phase-ar');

getMoonPhase(new Date('2026-11-25'));
// { age: 15.1, illumination: 99.9, phase: 'full', phaseAr: 'بدر', phaseEn: 'Full Moon' }

moonAge(new Date('2026-11-25')); // about 15.1 days
```

## The eight phases

| key | Arabic | English |
| --- | --- | --- |
| `new` | محاق | New Moon |
| `waxing_crescent` | هلال متزايد | Waxing Crescent |
| `first_quarter` | تربيع أول | First Quarter |
| `waxing_gibbous` | أحدب متزايد | Waxing Gibbous |
| `full` | بدر | Full Moon |
| `waning_gibbous` | أحدب متناقص | Waning Gibbous |
| `last_quarter` | تربيع أخير | Last Quarter |
| `waning_crescent` | هلال متناقص | Waning Crescent |

## How it works

The library counts the days since a reference new moon (2000-01-06 18:14 UTC) and wraps the result by the mean synodic month, 29.530588853 days. The age divided by the month length gives the position in the cycle. Illumination is `(1 - cos(2π × position)) / 2`. The position is rounded into one of eight equal bins, centred on each named phase.

## Accuracy

This is a mean-month approximation. The real moon speeds up and slows down along its orbit, so the result can differ from an ephemeris by a day or more for some dates. Do not use it to decide the start of a Hijri month. For sighting predictions and crescent visibility, see the [Hilal pages on ArabSkyPedia](https://arabskypedia.com/hilal/).

## Notes

- Date-only strings such as `2026-11-25` are read as midnight UTC. Pass a `Date` with an explicit time for a specific moment.
- An invalid date throws a `TypeError`.

## About

moon-phase-ar is MIT licensed and maintained by [ArabSkyPedia](https://arabskypedia.com/), a free Arabic reference for the sky. Source: [github.com/arabskypedia2/moon-phase-ar](https://github.com/arabskypedia2/moon-phase-ar). Package: [npmjs.com/package/moon-phase-ar](https://www.npmjs.com/package/moon-phase-ar).
