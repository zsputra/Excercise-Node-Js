
function fibonacci(n){
    if(n<=1){
        return n;
    }
    return fibonacci(n-2) + fibonacci(n-1);
}

function square(n){

    return fibonacci(n) * fibonacci(n+1);
}

module.exports = {fibonacci,square};