# jasmine spec for CrankTest


describe 'Backbone objects', ->
  describe 'CrankTest', ->
    it 'should exist', ->
      expect( CrankTest ).toBeDefined()

    describe 'Models', ->
      it 'should exist', ->
        expect( CrankTest.Models ).toBeDefined()

      describe 'Campaign Class', ->
        it 'should exist', ->
          expect( CrankTest.Models.Campaign ).toBeDefined()

        describe 'Campaign Object', ->
            beforeEach ->
              @campaign = new CrankTest.Models.Campaign name: "Test Campaign"
            
            it 'should be named "Test Campaign"', ->
              expect( @campaign.get "name" ).toEqual "Test Campaign"

      describe 'CrankTest.Models.Day', ->
        it 'should exist', ->
          expect( CrankTest.Models.Day ).toBeDefined()

        describe 'Day Object', ->
            beforeEach ->
              @day = new CrankTest.Models.Day 
                day: 1
                subject: "Test Subject"
                message: "Test Message"
                send_time: "2am"
                send_zone: "DST"
                campaign_id: 5
            
            it 'should have day 1', ->
              expect( @day.get "day" ).toEqual 1

            it 'should have subject "Test Subject"', ->
              expect( @day.get "subject" ).toEqual "Test Subject"

            it 'should have message "Test Message"', ->
              expect( @day.get "message" ).toEqual "Test Message"

            it 'should have send_time "2am"', ->
              expect( @day.get "send_time" ).toEqual "2am"

            it 'should have send_zone "DST"', ->
              expect( @day.get "send_zone" ).toEqual "DST"

            it 'should have campaign_id 5', ->
              expect( @day.get "campaign_id" ).toEqual 5

    describe 'CrankTest.Collections', ->
      it 'should exist', ->
        expect( CrankTest.Collections ).toBeDefined()

      describe 'CrankTest.Collections.CampaignsCollection', ->

        beforeEach -> 
          @campaigns = new CrankTest.Collections.CampaignsCollection [ 
            day: 1
            subject: "Test Subject 5.1"
            message: "Test Message 5.1"
            send_time: "2am"
            send_zone: "DST"
            campaign_id: 5
          ,
            day: 2
            subject: "Test Subject 5.2"
            message: "Test Message 5.2"
            send_time: "5pm"
            send_zone: "CST"
            campaign_id: 5
          ,
            day: 1
            subject: "Test Subject 3.1"
            message: "Test Message 3.1"
            send_time: "2am"
            send_zone: "DST"
            campaign_id: 3
          ,
            day: 2
            subject: "Test Subject 3.2"
            message: "Test Message 3.2"
            send_time: "5pm"
            send_zone: "CST"
            campaign_id: 3
          ,
            day: 3
            subject: "Test Subject 3.3"
            message: "Test Message 3.3"
            send_time: "8pm"
            send_zone: "GMT"
            campaign_id: 3
          ]

        it 'should exist', ->
          expect( CrankTest.Collections.CampaignsCollection ).toBeDefined()
        
      describe 'CrankTest.Collections.DaysCollection', ->
        it 'should exist', ->
          expect( CrankTest.Collections.DaysCollection ).toBeDefined()

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

