const isPangram = require('./pangram.js')

test("Abcdefghijklmnopqrstuvwxyz return true", ()=>{
    const string = "Abcdefghijklmnopqrstuvwxyz";
    expect(isPangram(string)).toEqual(true);
})

test("the quick brown fox jumps over the lazy dog", ()=>{
    const string = "the quick brown fox jumps over the lazy dog";
    expect(isPangram(string)).toEqual(true)
})

test("a quick movement of the enemy will jeopardize five gunboats return false", ()=>{
    const string = "a quick movement of the enemy will jeopardize five gunboats";
    expect(isPangram(string)).toEqual(false);
})

test("Pack my box with five dozen liquor jugs. return true", ()=>{
    const string = "Pack my box with five dozen liquor jugs.";
    expect(isPangram(string)).toEqual(true)
})

test("five boxing wizards jump quickly at it return true", ()=>{
    const string = "five boxing wizards jump quickly at it";
    expect(isPangram(string)).toEqual(false);
})

test("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog return false", ()=>{
    const string = "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog";
    expect(isPangram(string)).toEqual(false)
})

test("The_quick_brown_fox_jumps_over_the_lazy_dog", ()=>{
    const string = "The_quick_brown_fox_jumps_over_the_lazy_dog";
    expect(isPangram(string)).toEqual(true);
})

test("Five quacking Zephyrs jolt my wax bed. return false", ()=>{
    const string = "Five quacking Zephyrs jolt my wax bed.";
    expect(isPangram(string)).toEqual(true)
})