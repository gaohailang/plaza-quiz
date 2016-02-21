Template.VonVonEdit.helpers({
  print: function (data) {
    return JSON.stringify(data);
  },
  getQChoice: function(ids, doc) {
    var choices = [], choicesDir = {};
    doc.choices.forEach(function(i) {
      choicesDir[i.id] = i;
    });
    ids.forEach(function(i, idx) {
      choices.push(choicesDir[i]);
    });
    return choices;
  }
})