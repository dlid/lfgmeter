const parseMessage = require("./lib/parseMessage");

test('Ragefire Chasm - LFG rfc', () => {
  
  const result = parseMessage("LFG rfc");
  // console.log(JSON.stringify(result, null, 2));

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'RFC').length).toBe(1)

});

test('Ragefire Chasm - LFG ragefire chasm', () => {
  
  const result = parseMessage("LFG ragefire chasm");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'RFC').length).toBe(1)

});

test('Ragefire Chasm - LFG ragefire', () => {
  
  const result = parseMessage("LFG ragefire");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'RFC').length).toBe(1)

});
