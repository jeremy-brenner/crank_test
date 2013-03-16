# jasmine spec for CrankTest

describe 'Blah', ->
  describe 'Blah', ->
    model = null

    beforeEach ->
      model = new Foo({id: 1})

    it 'should not be new', ->
      expect( model.isNew() ).toEqual false 