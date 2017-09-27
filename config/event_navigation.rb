SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :accomodations, Accommodation.model_name.human(count: 2), event_accommodations_path(@event)
    primary.item :event_sessions, EventSession.model_name.human(count: 2), event_event_sessions_path(@event)
    primary.item :activities, Activity.model_name.human(count: 2), event_activities_path(@event)
    primary.item :tracks, Track.model_name.human(count: 2), event_tracks_path(@event)
    primary.item :participations, Participation.model_name.human(count: 2), event_participations_path(@event)
  end
end

# - if can? :read, Accommodation
# = link_to Accommodation.model_name.human(count: 2), event_accommodations_path(event), class: 'item'
# - if can? :read, EventSession
# = link_to EventSession.model_name.human(count: 2), event_event_sessions_path(event), class: 'item'
# - if can? :read, Event
# / = link_to Schedule.model_name.human(count: 2), event_schedules_path(event), class: 'item' - change this to new event schedule path.
# - if can? :read, Hotel
# = link_to Hotel.model_name.human(count: 2), event_hotels_path(event), class: 'item'
# - if can? :read, Activity
# = link_to Activity.model_name.human(count: 2), event_activities_path(event), class: 'item'
# - if can? :read, Track
# = link_to Track.model_name.human(count: 2), event_tracks_path(event), class: 'item'
# - if can? :read, Participation
# = link_to Participation.model_name.human(count: 2), event_participations_path(event), class: 'item'
