let n;
function squares(n){
    return  n == -1 || n== 0 ? "it's not a natural number" :  (n*(n+1)*(2*n+1))/6;
}

module.exports = squares;