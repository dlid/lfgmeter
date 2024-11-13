const parseMessage = require("./lib/parseMessage");

test('Scarlet Monastery - LFG SM', () => {
  
  const result = parseMessage("LFG sm");

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'SM').length).toBe(1)

});

test('Scarlet Monastery - LFG SM gy', () => {
  
  const result = parseMessage("LFG sm gy");
  // console.log(JSON.stringify(result, null, 2));

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'SMGY').length).toBe(1)

});


test('Scarlet Monastery - LFG sm grave', () => {
  
  const result = parseMessage("LFG sm grave");
  // console.log(JSON.stringify(result, null, 2));

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'SMGY').length).toBe(1)

});


test('Scarlet Monastery - LFG sm cath', () => {
  
  const result = parseMessage("LFG sm cath");
  // console.log(JSON.stringify(result, null, 2));

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'SMCATH').length).toBe(1)

});

test('Scarlet Monastery - LFG sm arm', () => {
  
  const result = parseMessage("LFG sm arm");
  // console.log(JSON.stringify(result, null, 2));

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'SMARMS').length).toBe(1)

});

test('Scarlet Monastery - LFG sm arms', () => {
  
  const result = parseMessage("LFG sm arms");
  // console.log(JSON.stringify(result, null, 2));

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'SMARMS').length).toBe(1)

});

test('Scarlet Monastery - LFG sm lib', () => {
  
  const result = parseMessage("LFG sm lib");
  // console.log(JSON.stringify(result, null, 2));

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'SMLIB').length).toBe(1)

});

test('Scarlet Monastery - LFG sm library', () => {
  
  const result = parseMessage("LFG sm library");
  // console.log(JSON.stringify(result, null, 2));

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'SMLIB').length).toBe(1)

});
