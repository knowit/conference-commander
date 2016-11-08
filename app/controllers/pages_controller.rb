class PagesController < ApplicationController
  def index
    render
  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
