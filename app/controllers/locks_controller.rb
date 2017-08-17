class LocksController < ApplicationController
  include Crudable

  before_action :find_lockable, only: [:index, :new]
  before_action :add_lockable, only: [:create]

  load_and_authorize_resource

  def index
    if @lockable.present?
      @locks = @lockable.locks
    end
  end

  def new
    # NOOP
  end

  def create
    if @lock.save
      redirect_to polymorphic_path([@lock.lockable, Lock])
    else
      render :new
    end
  end

  def edit
    # NOOP
  end

  def update
    if @lock.update(lock_params)
      redirect_to polymorphic_path([@lock.lockable, Lock])
    else
      render :new
    end
  end

  def destroy
    @lock.destroy

    redirect_to polymorphic_path([@lock.lockable, Lock])
  end

  private

  def lock_params
    params.require(:lock).permit(
      :id,
      :lockable_type,
      :lockable_id,
      :field,
      :locked_at
    )
  end

  def find_lockable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @lockable = $1.singularize.classify.constantize.find(value)
      end
    end
  end

  def add_lockable
    find_lockable
    if params[:lock]
      params[:lock][:lockable_id] = @lockable.id
      params[:lock][:lockable_type] = @lockable.class.name
    end
  end

end