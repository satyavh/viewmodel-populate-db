@Posts= new Mongo.Collection("posts")


if Meteor.isClient

  Template.fail.viewmodel
    dbValue: Posts.findOne(value: "hello")?.value
    result: ""

    allValid: ->
      @dbValue()?.length > 0

    submit: ->
      @result(@dbValue())



  Template.initsOnly.viewmodel
    dbValue: ->
      Posts.findOne(value: "hello")?.value

    result: ""

    allValid: ->
      @dbValue()?.length > 0

    submit: ->
      @result(@dbValue())


  Template.success.viewmodel
    dbValue: ->
      Posts.findOne(value: "hello")?.value
    
    result: ""

    checkValue: ->
      if $('#value').val().length > 0
        @allValid(true)
        return
      @allValid(false)

    allValid: true

    submit: ->
      @result($('#value').val())      