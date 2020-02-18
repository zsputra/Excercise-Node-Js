var {calculate,total} = require('./calculate_grains');

test("no a valid square", ()=>{
    expect(calculate(0)).toEqual("not a valid square");
})

test("no a valid square", ()=>{
    expect(calculate(-1)).toEqual("not a valid square");
})

test("no a valid square", ()=>{
    expect(calculate(65)).toEqual("not a valid square");
})

test("no a valid square", ()=>{
    expect(calculate(32)).toEqual(2147483648);
})


test("no a valid square", ()=>{
    expect(total()).toEqual(18446744073709551615n);
})

