var urlList = require('./people.json');

var older_24  =urlList.filter(function(e){
    return e.age > 24;
})

var total = urlList.reduce((accumulator,y)=>{
        return accumulator+y.age;
},0)

var female_coder = urlList.filter(function(e){
    return e.gender == 'f';
})

function compare(a, b) {
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

var us_asc = urlList.filter(function(e){
    return e.us == true;
}).sort(compare);


var sort_by_age = urlList.sort(function(a,b){
    return a.age - b.age;
})

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
