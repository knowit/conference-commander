class PagesController < ApplicationController
  def index
    render
  end

  def show
    @current_page = params[:page]
    render template: "pages/#{params[:page]}"
  end

  def front
    @frontpage = true
    @current_event = Event.last
    @next_events = Event.next_events(current_user&.administrator?)
  end
end
