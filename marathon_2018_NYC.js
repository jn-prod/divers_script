// from page: https://results.nyrr.org/event/M2018/finishers

$.ajax({
  url: 'https://results.nyrr.org/api/runners/finishers',
  method: 'POST',
  dataType: 'json',
  contentType: 'application/json',
  data: JSON.stringify({
    ageGroup:  null,
    city:  null,
    eventCode: 'M2018',
    gender:  null,
    handicap:  null,
    pageIndex: 1,
    pageSize:  10000,
    runnerId:  null,
    searchString:  null,
    sortColumn:  'overallTime',
    sortDescending:  false 
  }),
  beforeSend: function(xhr) {
    xhr.setRequestHeader('Token', 'ebe04e9c08064536');
  },
  success: function(data) {
    console.log(data)
  },
  error: function(err) {
    console.log(err)
  }
})
