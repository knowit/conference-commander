SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :hotels, Hotel.model_name.human(count: 2), event_hotels_path(@event), if: -> { can?(:read, Hotel) }, highlights_on: %r(/hotels)
    primary.item :accommodations, Accommodation.model_name.human(count: 2), event_accommodations_path(@event), if: -> { can?(:read, Accommodation) }, highlights_on: %r(accommodations)
    primary.item :event_sessions, EventSession.model_name.human(count: 2), event_event_sessions_path(@event), if: -> { can?(:read, EventSession) }, highlights_on: %r(/event_sessions)
    primary.item :activities, Activity.model_name.human(count: 2), event_activities_path(@event), if: -> { can?(:read, Activity) }, highlights_on: %r(/activities)
    # primary.item :tracks, Track.model_name.human(count: 2), event_tracks_path(@event), if: -> { can?(:read, Track) }, highlights_on: %r(/tracks)
    primary.item :venues, Venue.model_name.human(count: 2), event_venues_path(@event), if: -> { can?(:read, Venue) }, highlights_on: %r(/venues)
    primary.item :participations, Participation.model_name.human(count: 2), event_participations_path(@event), if: -> { can?(:manage, Participation) }, highlights_on: %r(/participations)
  end
end