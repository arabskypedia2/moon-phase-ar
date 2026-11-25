const { getMoonPhase, moonAge } = require('./index');

function assert(cond, msg) { if (!cond) { console.error('FAIL:', msg); process.exit(1); } }

// Known lunations (timeanddate lunar calendar): New Moon 2026-11-09, New Moon ~2026-07-14.
assert(getMoonPhase('2026-11-09').phase === 'new', 'new moon 2026-11-09');
assert(getMoonPhase('2026-11-25').phaseAr === 'بدر', 'full moon near 2026-11-24/25');
assert(getMoonPhase('2026-07-15').phase === 'new', 'new moon near 2026-07-14/15');

// Input validation
let threw = false;
try { getMoonPhase('not-a-date'); } catch (e) { threw = e instanceof TypeError; }
assert(threw, 'invalid input throws TypeError');

// Boundary dates
assert(getMoonPhase('1950-06-15').age >= 0, 'far past ok');
assert(getMoonPhase('2099-06-15').age < 30, 'far future ok');

// Date object vs string parity
const a = getMoonPhase('2026-11-25T12:00:00Z');
const b = getMoonPhase(new Date(Date.UTC(2026, 10, 25, 12)));
assert(a.phase === b.phase && a.age === b.age, 'Date/string parity');

console.log('all tests passed');
