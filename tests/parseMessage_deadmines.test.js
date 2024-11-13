const parseMessage = require("./lib/parseMessage");


test('Deadmines - LFG vc', () => {
  
  const result = parseMessage("LFG vc");

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'The Deadmines').length).toBe(1)

});

test('Deadmines - LFG deadmines', () => {
  
  const result = parseMessage("LFG deadmines");
  // console.log(JSON.stringify(result, null, 2))
  
  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'The Deadmines').length).toBe(1)

});

test('Deadmines/Dire Maul - LFG DM', () => {
  
  const result = parseMessage("LFG dm");

  expect(result.matches.length).toBe(2)
  expect(result.matches.filter(m => m.dungeonId == 'VC').length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Dire Maul').length).toBe(1)

});
