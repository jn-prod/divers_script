// url: http://bases.athle.com/asp.net/liste.aspx?frmpostback=true&frmbase=calendrier&frmmode=1&frmespace=0&frmsaison=2019&frmtype1=Hors+Stade&frmtype2=&frmtype3=&frmtype4=&frmniveau=&frmniveaulab=&frmligue=BRE&frmdepartement=&frmepreuve=&frmdate_j1=&frmdate_m1=&frmdate_a1=&frmdate_j2=&frmdate_m2=&frmdate_a2=
var urls = []
document.querySelectorAll('a').forEach(function(val){
  var url = val.pathname;
  if(url !== '/asp.net/liste.aspx' && url !== ''){
    urls.push('http://bases.athle.com/asp.net/competitions.aspx?base=calendrier&id=' + url.split("'")[1])
  }
})
// console.log(urls)

// single scrap
var emails = []
function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}
urls.forEach(function(url) {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', url);
  xhr.onload = function() {
    if (xhr.status === 200) {
      var inputSplit = xhr.response.split(':')
      inputSplit.forEach(function(input){
        var email = input.split('?')[0];
        if (validateEmail(email)) {
          emails.push(email);
        }
      });
    }
    else {
      alert('Request failed.  Returned status of ' + xhr.status);
    }
  };
  xhr.send();
})
console.log(emails)
// console.save(emails, 'base-athle-emails.js')