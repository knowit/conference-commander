SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'left menu'
    primary.item :front_page, 'Front page', root_path, class: 'item'
    primary.item :events, Event.model_name.human(count: 2), events_path, class: 'item'
    primary.item :users, User.model_name.human(count: 2), users_path, class: 'item'
  end
end

