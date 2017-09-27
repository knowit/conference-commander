SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :accomodations, Accommodation.model_name.human(count: 2), event_accommodations_path(@event), if: -> { can?(:read, Accommodation) }
    primary.item :event_sessions, EventSession.model_name.human(count: 2), event_event_sessions_path(@event), if: -> { can?(:read, EventSession) }
    primary.item :activities, Activity.model_name.human(count: 2), event_activities_path(@event), if: -> { can?(:read, Activity) }
    primary.item :tracks, Track.model_name.human(count: 2), event_tracks_path(@event), if: -> { can?(:read, Track) }
    primary.item :participations, Participation.model_name.human(count: 2), event_participations_path(@event), if: -> { can?(:read, Participation) }
  end
end