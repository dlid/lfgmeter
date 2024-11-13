const parseMessage = require("./lib/parseMessage");

test('Wailing Caverns - LFG wc', () => {
  
  const result = parseMessage("LFG wc");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId == 'WC').length).toBe(1)

});
 
test('Wailing Caverns - LFG wailing caverns', () => {
  
  const result = parseMessage("LFG wailing caverns");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeonId== 'WC').length).toBe(1)

});
 