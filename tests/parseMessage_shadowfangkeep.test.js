const parseMessage = require("./lib/parseMessage");


test('Shadowfang Keep - LFG sfk healer', () => {
  
  const result = parseMessage("LFG sfk healer");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Shadowfang Keep').length).toBe(1)

});
 