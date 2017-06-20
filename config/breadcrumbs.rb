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
