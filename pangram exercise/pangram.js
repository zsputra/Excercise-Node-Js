const isPangram = function (string){
    // string = string.toLowerCase;
    var regex = /([a-z])(?!.*\1)/ig;
    return (string.match(regex) || []).length === 26;
}

const string = "abcdefghijklmnopqrstuvwxyz";



const otherPangram = function(words){
    return [...string].every(x=> words.toLowerCase().includes(x));
}

module.exports = otherPangram;

