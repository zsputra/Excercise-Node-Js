const squares = require('./calculator')

test('return not a natural number', ()=>{
    expect(squares(0)).toEqual("it's not a natural number")
})

test('return not a natural number', ()=>{
    expect(squares(-1)).toEqual("it's not a natural number")
})

test('return right number', ()=>{
    expect(squares(1)).toEqual(1)
})

test('give 2 return 5', ()=>{
    expect(squares(2)).toEqual(5)
})

test('give 100000 return 333338333350000', ()=>{
    expect(squares(100000)).toEqual(333338333350000)
})

