module AfterSignupHelper
  def step_classes(step)
    classes = []
    classes << case
    when past_step?(step)
      'completed'
    when future_step?(step)
      'future'
    end

    classes << 'active' if step == params[:id].to_sym
    classes << 'step'
    classes.join(' ')
  end
end
