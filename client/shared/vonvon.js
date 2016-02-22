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
  },
  getQAns: function(idx) {
    var ans = Session.get('__anws');
    return ans[idx] ? ans[idx].join(',') : '尚未回答';
  },
  getResult: function() {
    return JSON.stringify(Session.get('__result'));
  }
})

Template.VonVonEdit.events = {
  'click .choice-li': function(e, t) {
    var idx = $(e.target).parents('.question-li').data('question-idx');
    var ans = Session.get('__anws');
    ans[idx] = [this.question_id, this.id];
    Session.set('__anws', ans);
    console.log('ans:', t.data.__anws);
  },
  'click .answer-submit': function(e, t) {
    var ans = Session.get('__anws');
    var quiz = Session.get('admin_doc').quiz;
    console.log(ans);
    Meteor.call('vonvonSubmitAns', ans, quiz, function(e, data) {
      console.log('arguments:', data);
      t.data.result = data;
      Session.set('__result', data);
    });
  }
}

Template.VonVonEdit.onCreated( function() {
  var data = this.data;
  // this.data.__anws = [];
  Session.set('__anws', []);
  console.log( "onCreated: ", data );
});