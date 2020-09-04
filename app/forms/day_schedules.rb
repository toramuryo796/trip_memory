class DaySchedules
  include ActiveModel::Model
  attr_accessor :day, :program, :category_id, :format, :user_id, :time

  def save
    plan_id = format
    if DayHow.find_by(day: 1).present?
      @day = DayHow.where(day: 1, plan_id: plan_id)
    else
      @day = DayHow.create(day: 1, plan_id: plan_id)
    end
      Schedule.create(program: program, category_id: category_id, plan_id: plan_id, user_id: user_id, day_how_id: @day.ids, move_time: time) 
  end
end


