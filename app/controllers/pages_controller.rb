class PagesController < ApplicationController
  def index
    render layout: "pages_index"
  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
