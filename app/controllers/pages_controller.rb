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
  end
end
