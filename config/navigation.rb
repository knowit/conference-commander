SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'left menu'
    primary.item :front_page, t('menu.frontpage'), root_path, class: 'item'
    primary.item :events, Event.model_name.human(count: 2), events_path, class: 'item', if: -> { can?(:read, Event) }
    primary.item :users, User.model_name.human(count: 2), users_path, class: 'item', if: -> { can?(:manage, User) }
  end
end
