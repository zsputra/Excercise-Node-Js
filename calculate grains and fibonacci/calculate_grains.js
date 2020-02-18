
function calculate(n){
    return n <= 0 || n == 65 ?  "not a valid square" : Math.pow(2,(n-1));
}

function total(){

    return (1n<<64n) - 1n;

}

module.exports = {calculate, total};