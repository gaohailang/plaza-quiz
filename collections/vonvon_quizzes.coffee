@VvQuizs = new Meteor.Collection('vonvon_quizzes');

Schemas.VvQuizs = new SimpleSchema
  "quiz.title":
    type:String
    max: 60

  "quiz.desc":
    type: String
    autoform:
      rows: 5

  "quiz.type":
    type: String
    allowedValues: ["A", "B", "C", "E"]
    ###autoValue: ->
      if this.isInsert
        new Date()###

  "quiz.created_at":
    type: String
    ###type:Date
    optional:true
    autoValue: ->
      if this.isCreate
        new Date()###

  "quiz.image_url":
    type: String
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Attachments'

  "questions.$.text":
    type: String
    autoform:
      rows: 5

  "questions.$.choiceIds":
    type: Object

  "questions.$.type":
    type: String
    allowedValues: ["M", "D", "I", "T", "U"]

  "choices.$.text":
    type: String
    autoform:
      rows: 5

  "choices.$.type":
    type: String
    allowedValues: ["M", "D", "I", "T", "U"]

  ###owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id###

VvQuizs.attachSchema(Schemas.VvQuizs)

VvQuizs.helpers
  labelstr: ->
    "#{@quiz.title} 类型:#{@quiz.type} - 问题数:#{@questions.length}"
    ###user = Meteor.users.findOne(@owner)
    if user?.profile?.firstName? and user?.profile?.lastName
      user.profile.firstName + ' ' + user.profile.lastName
    else
      user?.emails?[0].address###
