// moon-phase-ar — moon phase calculator with Arabic phase names
// Simple synodic-month approximation. Reference new moon: 2000-01-06 18:14 UTC.
// Results are indicative and may differ from precise astronomical ephemerides
// by a day or more for some dates.

const SYNODIC_MONTH = 29.530588853; // days
const REF_NEW_MOON = Date.UTC(2000, 0, 6, 18, 14, 0); // ms

const PHASES = [
  { key: 'new',             ar: 'محاق',          en: 'New Moon' },
  { key: 'waxing_crescent', ar: 'هلال متزايد',   en: 'Waxing Crescent' },
  { key: 'first_quarter',   ar: 'تربيع أول',     en: 'First Quarter' },
  { key: 'waxing_gibbous',  ar: 'أحدب متزايد',   en: 'Waxing Gibbous' },
  { key: 'full',            ar: 'بدر',           en: 'Full Moon' },
  { key: 'waning_gibbous',  ar: 'أحدب متناقص',   en: 'Waning Gibbous' },
  { key: 'last_quarter',    ar: 'تربيع أخير',    en: 'Last Quarter' },
  { key: 'waning_crescent', ar: 'هلال متناقص',   en: 'Waning Crescent' },
];

function moonAge(date) {
  const t = (date instanceof Date ? date : new Date(date)).getTime();
  if (Number.isNaN(t)) throw new TypeError('invalid date');
  const days = (t - REF_NEW_MOON) / 86400000;
  return ((days % SYNODIC_MONTH) + SYNODIC_MONTH) % SYNODIC_MONTH;
}

function getMoonPhase(date) {
  const age = moonAge(date);
  const frac = age / SYNODIC_MONTH;
  const illumination = Math.round(((1 - Math.cos(2 * Math.PI * frac)) / 2) * 1000) / 10;
  const idx = Math.floor(((frac + 1 / 16) % 1) * 8);
  const phase = PHASES[idx];
  return {
    age: Math.round(age * 10) / 10,
    illumination,
    phase: phase.key,
    phaseAr: phase.ar,
    phaseEn: phase.en,
  };
}

module.exports = { getMoonPhase, moonAge, PHASES, SYNODIC_MONTH };
