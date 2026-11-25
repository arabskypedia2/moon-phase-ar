# moon-phase-ar — حاسبة طور القمر بالعربية

مكتبة JavaScript صغيرة لحساب طور القمر لأي تاريخ: اسم الطور بالعربية والإنجليزية، عمر القمر بالأيام، ونسبة الإضاءة.

A tiny JavaScript moon-phase calculator with Arabic phase names: phase, moon age in days, and illumination percentage for any date.

من إعداد **[موسوعة السماء العربية — ArabSkyPedia](https://arabskypedia.com/)**، موسوعة فلكية عربية مفتوحة القراءة تنشر مقالات وأدوات تفاعلية عن القمر والنجوم والكواكب.

Maintained by **[ArabSkyPedia — موسوعة السماء العربية](https://arabskypedia.com/)**, a free Arabic astronomy encyclopedia.

## التثبيت — Install

```bash
npm install moon-phase-ar
```

## الاستخدام — Usage

```js
const { getMoonPhase } = require('moon-phase-ar');

const result = getMoonPhase(new Date('2026-11-25'));
console.log(result);
// {
//   age: 15.1,
//   illumination: 99.9,
//   phase: 'full',
//   phaseAr: 'بدر',
//   phaseEn: 'Full Moon'
// }
```

## الأطوار — Phases

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

## الدقة — Accuracy

تستخدم المكتبة تقريب الشهر الاقتراني (29.530588853 يومًا)، فالنتائج إرشادية وقد تختلف عن التقويمات الفلكية الدقيقة بفارق يوم أو أكثر لبعض التواريخ.

The library uses a simple synodic-month approximation (29.530588853 days). Results are indicative and may differ from precise astronomical ephemerides by a day or more for some dates.

## واجهة برمجية — API

- `getMoonPhase(date)` — يعيد كائن الطور الكامل. Returns the full phase object.
- `moonAge(date)` — عمر القمر بالأيام فقط. Moon age in days only.
- `PHASES` — قائمة الأطوار الثمانية. The list of the eight phases.

## ملاحظات — Notes

- السلاسل بصيغة `YYYY-MM-DD` تُفسَّر عند منتصف الليل UTC؛ لنتيجة لحظة محددة مرّر كائن `Date` بوقت واضح. Date-only strings are interpreted at midnight UTC; pass an explicit `Date` for a specific moment.
- الحزمة جزء من أدوات [موسوعة السماء العربية](https://arabskypedia.com/) التعليمية وتُصان باستمرار. This package is maintained as part of ArabSkyPedia's open educational tools.

## روابط — Links

- [الحزمة على npm — Package on npm](https://www.npmjs.com/package/moon-phase-ar)
- [مختبر طور القمر التفاعلي — Interactive moon-phase lab](https://arabskypedia2.github.io/)
- [أطلس السماء التفاعلي — Interactive sky atlas](https://arabskypedia.com/atlas/)
- [شرح المكتبة على DEV — Library walkthrough article](https://dev.to/arabskypedia/kyf-thsb-twr-lqmr-blg-javascript-shrh-mktb-moon-phase-ar-57kb)
- [موسوعة السماء العربية — ArabSkyPedia](https://arabskypedia.com/)

## الترخيص — License

MIT
