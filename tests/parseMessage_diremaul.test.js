const parseMessage = require("./lib/parseMessage");

test('Dire maul - dm west', () => {
  const result = parseMessage("LFG dm west");

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'DM').length).toBe(1)
});

test('Dire maul - dm east', () => {
  const result = parseMessage("LFG dm east");

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'DM').length).toBe(1)
});

test('Dire maul - dm west', () => {
  const result = parseMessage("LFG dm west");

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'DM').length).toBe(1)
});


test('Dire maul - dm north', () => {
  const result = parseMessage("LFG dm north");

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'DM').length).toBe(1)
});

test('Dire maul - dm south', () => {
  const result = parseMessage("LFG dm south");

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'DM').length).toBe(1)
});

test('Dire maul/Deadmines - LFG dm', () => {
  const result = parseMessage("LFG dm");

  expect(result.matches.length).toBe(2)
  expect(result.matches.filter(m => m.dungeonId == 'DM').length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'VC').length).toBe(1)
});
