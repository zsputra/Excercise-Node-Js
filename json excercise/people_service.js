var urlList = require('./people.json');


const filter_age = function(e){
    return e.age > 24;
}

const sum_age = function(accumulator,y){
    return accumulator+y.age;
}

const female = function(e){
    return e.gender == 'f';
}

var older_24  =urlList.filter(filter_age);

var total = urlList.reduce(sum_age,0)


var female_coder = urlList.filter(female)


const compare = function(a, b) {
    // Use toUpperCase() to ignore character casing
    const bandA = a.name.toUpperCase();
    const bandB = b.name.toUpperCase();
  
    let comparison = 0;
    if (bandA > bandB) {
      comparison = 1;
    } else if (bandA < bandB) {
      comparison = -1;
    }
    return comparison;
  }

const usaFunction = function(e){
    return e.us == true;
}

var us_asc = urlList.filter(usaFunction).sort(compare);

const compare_age = function(a,b){
    return a.age - b.age;
}

var sort_by_age = urlList.sort(compare_age)


var total_under_25 = urlList.filter(function(e){
    return e.age < 25;
}).reduce((acc, a) => {
    return acc + a.age;
},0);

var model_over_30 = urlList.filter(function(e){
    return e.age > 30 && e.gender == 'm';
})

var total_3_city = urlList.filter((e)=>{
    return e.location == "texas" || e.location == "new york" || e.location == "las vegas";
}).reduce((acc, a)=>{
    return acc + a.age;
},0);

function isPangram(string) {
    var regex = /([a-z])(?!.*\1)/g;
    return (string.match(regex) || []).length === 26;
}


