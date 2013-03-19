# jasmine spec for CrankTest


describe 'Backbone objects', ->
  describe 'CrankTest', ->
    it 'exists', ->
      expect( CrankTest ).toBeDefined()

    describe 'Models', ->
      it 'exists', ->
        expect( CrankTest.Models ).toBeDefined()
      
      describe 'Day', ->
        describe 'Class', ->
          it 'exists', ->
            expect( CrankTest.Models.Day ).toBeDefined()

        describe 'Instance', ->
            beforeEach ->
              @day = new CrankTest.Models.Day 
                day: 1
                subject: "Test Subject"
                message: "Test Message"
                send_time: "2am"
                send_zone: "DST"
                campaign_id: 1
            
            it 'has "day" == 1', ->
              expect( @day.get "day" ).toEqual 1

            it 'has "subject" == "Test Subject"', ->
              expect( @day.get "subject" ).toEqual "Test Subject"

            it 'has "message" == "Test Message"', ->
              expect( @day.get "message" ).toEqual "Test Message"

            it 'has "send_time" == "2am"', ->
              expect( @day.get "send_time" ).toEqual "2am"

            it 'has "send_zone" == "DST"', ->
              expect( @day.get "send_zone" ).toEqual "DST"

            it 'has "campaign_id" == 5', ->
              expect( @day.get "campaign_id" ).toEqual 1  

      describe 'Campaign', ->
        describe 'Class', ->
          it 'exists', ->
            expect( CrankTest.Models.Campaign ).toBeDefined()

        describe 'Instance', ->
            beforeEach ->
              @campaign = new CrankTest.Models.Campaign name: "Test Campaign"
            
            it 'has "name" == "Test Campaign"', ->
              expect( @campaign.get "name" ).toEqual "Test Campaign"


    describe 'Collections', ->
      it 'exists', ->
        expect( CrankTest.Collections ).toBeDefined()

      describe 'DaysCollection', ->
        describe 'Class', ->
          it 'exists', ->
            expect( CrankTest.Collections.DaysCollection ).toBeDefined()

        describe 'Instance', ->
          beforeEach ->
            @days = new CrankTest.Collections.DaysCollection [ 
              day: 1
              subject: "Test Subject 5.1"
              message: "Test Message 5.1"
              send_time: "2am"
              send_zone: "DST"
              campaign_id: 1
            ,
              day: 2
              subject: "Test Subject 5.2"
              message: "Test Message 5.2"
              send_time: "5pm"
              send_zone: "CST"
              campaign_id: 1
            ,
              day: 1
              subject: "Test Subject 3.1"
              message: "Test Message 3.1"
              send_time: "2am"
              send_zone: "DST"
              campaign_id: 2
            ,
              day: 2
              subject: "Test Subject 3.2"
              message: "Test Message 3.2"
              send_time: "5pm"
              send_zone: "CST"
              campaign_id: 2
            ,
              day: 3
              subject: "Test Subject 3.3"
              message: "Test Message 3.3"
              send_time: "8pm"
              send_zone: "GMT"
              campaign_id: 2
            ]

          it 'has 5 models', ->
            expect( @days.length ).toEqual 5

          it 'has 2 models in campaign 1', ->
            expect( @days.where( campaign_id: 1 ).length ).toEqual 2

          it 'has 3 models in campaign 2', ->
            expect( @days.where( campaign_id: 2 ).length ).toEqual 3

      describe 'Campaigns', ->    
        describe 'Class', ->
          it 'exists', ->
            expect( CrankTest.Collections.CampaignsCollection ).toBeDefined()

        describe 'Instance', ->
          beforeEach ->
            @campaigns = new CrankTest.Collections.CampaignsCollection [
              id: 1
              name: "Test Campaign 1"
            ,
              id: 2
              name: "Test Campaign 2"
            ]
            
          it 'has 2 models', ->
            expect( @campaigns.length ).toEqual 2

    describe 'Routers', ->
      it 'exists', ->
        expect( CrankTest.Routers ).toBeDefined()

      describe 'CampaignsRouter', ->
        it 'exists', ->
          expect( CrankTest.Routers.CampaignsRouter ).toBeDefined()

      describe 'DaysRouter', ->
        it 'exists', ->
          expect( CrankTest.Routers.DaysRouter ).toBeDefined()

    describe 'Views', ->
      it 'exists', ->
        expect( CrankTest.Views ).toBeDefined()

      describe 'Campaigns', ->
        it 'exists', ->
          expect( CrankTest.Views.Campaigns ).toBeDefined()

      describe 'Days', ->
        it 'exists', ->
          expect( CrankTest.Views.Days ).toBeDefined()

