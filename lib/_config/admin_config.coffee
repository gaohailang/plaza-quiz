@AdminConfig =
  name: Config.name
  collections:
    Posts:
      color: 'red'
      icon: 'pencil'
      extraFields: ['owner']
      tableColumns: [
        { label: 'Title', name: 'title' }
        { label: 'User', name: 'author()', template: 'adminUserCell' }
      ]
    Comments:
      color: 'green'
      icon: 'comments'
      tableColumns: [
        { label: 'Content', name: 'content' }
        { label: 'Post', name: 'docTitle()', template: 'adminPostCell' }
        { label: 'User', name: 'author()', template: 'adminUserCell' }
      ]
      extraFields: ['doc', 'owner']
      children: [
        {
          find: (comment) ->
            Posts.find comment.doc, limit: 1
        }
        {
          find: (comment) ->
            Meteor.users.find comment.owner, limit: 1
        }
      ]
    VvQuizs:
      color: 'yellow'
      icon: 'pencil'
      tableColumns: [
        {label: 'Title', name: 'quiz.title'},
        {label: 'Type', name: 'quiz.type'}
      ]
      templates:
        edit:
          name: "VonVonEdit"
          data:
            fields: ["quiz", "questions", "choices"]
  dashboard:
    homeUrl: '/dashboard'
  autoForm:
    omitFields: ['createdAt', 'updatedAt']
