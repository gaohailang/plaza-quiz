var vonvonUrl = 'http://cn.vonvon.net/api2/answer/';
Meteor.methods({
  vonvonSubmitAns: function(ans, quiz) {
    console.log(arguments);
    // var fut = new Future();
    try{
      var res = request.postSync(vonvonUrl+quiz.id, {
        json: {
          "choices":ans,
          "profiles":[],"snsimgs":[],"with_tags":[],"taken":false,"date_inputs":{},"sns_friends":{}
        }
      });
      console.log(res.body);
      // fut['return'](message + " (delayed for 3 seconds)");
      return res.body;
    }catch(e) {
      console.log('request err:', e);
    }
    // return fut.wait();
  }
});
