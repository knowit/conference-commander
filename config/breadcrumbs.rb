crumb :root do
  link "Home", root_path
end

crumb :events do
  link Event.model_name.human(count:2), events_path
end

crumb :event do |event|
  parent :events
  link event.name, event_path(event)
end

crumb :users do
  link User.model_name.human(count:2), users_path
end

crumb :user do |user|
  parent :users
  link user.full_name, user_path(user)
end

crumb :edit_user do |user|
  parent :users
  link user.full_name, edit_user_path(user)
end

crumb :event_sessions do |event|
  parent :events
  parent :event, event
  link EventSession.model_name.human(count:2), event_sessions_path
end

crumb :event_session do |event_session, event|
  parent :events
  parent :event, event
  link event_session.title, event_event_session_path(event_session)
end

crumb :participations do |event|
  parent :events
  parent :event, event
  link Participation.model_name.human(count:2), event_participations_path(event)
end
