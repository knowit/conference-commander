class ImagesController < ApplicationController

  before_action :add_imageable, only: [:create]

  load_and_authorize_resource

  def create
    respond_to do |format|
      if @image.save
        format.js { render 'images/create' }
      else
        format.js { render 'images/error' }
      end
    end
  end

  def show
    file = File.new(@image.file.path)

    send_external_file(file, @image)
  end

  def destroy
    @image.destroy
  end

  private

  def image_params
    params.require(:image).permit(
      :file,
      :imageable_id,
      :imageable_type
    )
  end

  def send_external_file(file_ref, image)
    send_file file_ref, filename: File.basename(image.file_file_name), disposition: 'inline'
  end

  def find_imageable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @imageable = $1.singularize.classify.constantize.find(value)
      end
    end
  end

  def add_imageable
    find_imageable
    if params[:image]
      params[:image][:imageable_id] = @imageable.id
      params[:image][:imageable_type] = @imageable.class.name
    end
  end
end