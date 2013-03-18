# jasmine spec for CrankTest


describe 'App objects', ->
  describe 'CrankTest', ->
    it 'should exist', ->
      expect( CrankTest ).toBeDefined()

    describe 'CrankTest.Collections', ->
      it 'should exist', ->
        expect( CrankTest.Collections ).toBeDefined()

      describe 'CrankTest.Collections.CampaignsCollection', ->
        it 'should exist', ->
          expect( CrankTest.Collections.CampaignsCollection ).toBeDefined()

      describe 'CrankTest.Collections.DaysCollection', ->
        it 'should exist', ->
          expect( CrankTest.Collections.DaysCollection ).toBeDefined()

    describe 'CrankTest.Models', ->
      it 'should exist', ->
        expect( CrankTest.Models ).toBeDefined()

      describe 'CrankTest.Models.Campaign', ->
        it 'should exist', ->
          expect( CrankTest.Models.Campaign ).toBeDefined()

      describe 'CrankTest.Models.Day', ->
        it 'should exist', ->
          expect( CrankTest.Models.Day ).toBeDefined()

    describe 'CrankTest.Routers', ->
      it 'should exist', ->
        expect( CrankTest.Routers ).toBeDefined()

      describe 'CrankTest.Routers.CampaignsRouter', ->
        it 'should exist', ->
          expect( CrankTest.Routers.CampaignsRouter ).toBeDefined()

      describe 'CrankTest.Routers.DaysRouter', ->
        it 'should exist', ->
          expect( CrankTest.Routers.DaysRouter ).toBeDefined()

    describe 'CrankTest.Views', ->
      it 'should exist', ->
        expect( CrankTest.Views ).toBeDefined()

      describe 'CrankTest.Views.Campaigns', ->
        it 'should exist', ->
          expect( CrankTest.Views.Campaigns ).toBeDefined()

      describe 'CrankTest.Views.Days', ->
        it 'should exist', ->
          expect( CrankTest.Views.Days ).toBeDefined()

