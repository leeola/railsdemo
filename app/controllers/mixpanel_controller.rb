require 'mixpanel-ruby'
require 'mixpanel_client'
require 'json'

class MixpanelController < ApplicationController
  def index
    tracker = Mixpanel::Tracker.new('YOUR_API_TOKEN')
    # Use our Mixpanel Tracker, to send an event on this page load.
    tracker.track('anonymous', 'User viewed page')

    # Have our Event model load all of our Events from Postgres
    # For the usage of this object, see
    # app/views/mixpanel/index.html.erb
    @events = Event.order('created_at DESC').all
  end
  def post
    client = Mixpanel::Client.new(
      api_key:    'YOUR_API_KEY',
      api_secret: 'YOUR_API_SECRET'
    )
    data = client.request('events',
        event: ["User viewed page"],
        type: "general",
        unit: "day",
        interval: 1,
    )

    days = data['data']['values']['User viewed page']
    days.each do |key, count|
      event = Event.new(event: 'User viewed page', time: key, count: count)
      event.save
    end

    puts JSON.pretty_generate days
    redirect_to '/'
  end
end

