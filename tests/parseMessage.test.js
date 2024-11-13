const parseMessage = require("./lib/parseMessage");

test('"LFG bfd" should return Blackfathom Deeps', () => {
  
  const result = parseMessage("LFG bfd");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Blackfathom Deeps').length).toBe(1)

});

test('"LFG stockades" should return The Stockade', () => {
  
  const result = parseMessage("LFG stockades");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'The Stockade').length).toBe(1)

});
 
test('"LFG stockade" should return The Stockade', () => {
  
  const result = parseMessage("LFG stockade");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'The Stockade').length).toBe(1)

});
 
test('"LFG Gnomer" should return Gnomeregan', () => {
  
  const result = parseMessage("LFG gnomer");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Gnomeregan').length).toBe(1)

});
 

test('"LFG Gnome" should return Gnomeregan', () => {
  
  const result = parseMessage("LFG gnome");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Gnomeregan').length).toBe(1)

});
 
test('"LFG rfk" should return Razorfen Kraul', () => {
  
  const result = parseMessage("LFG rfk");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Razorfen Kraul').length).toBe(1)

});
 
test('"LFM rfd 3 dps " should return Razorfen Downs', () => {
  
  const result = parseMessage("LFM rfd 3 dps ");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Razorfen Downs').length).toBe(1)

});
 
test('"LFM ulda " should return Uldaman', () => {
  
  const result = parseMessage("LFM ulda");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Uldaman').length).toBe(1)

});
 
test('"LFM zf " should return Zul\'Farrak', () => {
  
  const result = parseMessage("LFM zf");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == `Zul'Farrak`).length).toBe(1)

});
 
test('"LFM mara " should return Maraudon', () => {
  
  const result = parseMessage("LFM mara");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == 'Maraudon').length).toBe(1)

});
 
 
test('"LFM ST " should return The Temple of Atal\'Hakkar', () => {
  
  const result = parseMessage("LFM st");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == `The Temple of Atal'Hakkar`).length).toBe(1)

});
 
test('"LFM 20:00 ST " should not return The Temple of Atal\'Hakkar since ST is probably a timezone', () => {
  
  const result = parseMessage("LFM 20:00 st");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(0)

});
 
test('"LFM brd" should  return Blackrock Depths', () => {
  
  const result = parseMessage("LFM brd");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == `Blackrock Depths`).length).toBe(1)
  

});
 

test('"LFM lbrs" should  return Lower Blackrock Spire', () => {
   
  const result = parseMessage("LFM lbrs");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == `Lower Blackrock Spire`).length).toBe(1)
  

});

test('"LFM lower black" should  return Lower Blackrock Spire', () => {
  
  const result = parseMessage("LFM lower black");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == `Lower Blackrock Spire`).length).toBe(1)
  
 
});
 
test('"LFM lower blackrock should  return Lower Blackrock Spire', () => {
  
  const result = parseMessage("LFM lower blackrock");
  //console.log(JSON.stringify(result, null, 2)); 

  expect(result.matches.length).toBe(1)
  expect(result.matches.filter(m => m.dungeon == `Lower Blackrock Spire`).length).toBe(1)
  
 
});
 

 
 
 
 
 
 

 
 
 
