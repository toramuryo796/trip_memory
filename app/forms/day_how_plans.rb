class DayHowPlans
  include ActiveModel::Model
  attr_accessor :title, :destination, :departure_day, :return_day, :hotel, :hotel_memo, :transportation_id, :ticket, :start_place, :passed, :group_id, :user_id, :candidate_id

  with_options presence: true do
    validates :title, :destination
  end

  max = { maximum: 400, message: "は400字以内で記入してください"}
  validates :ticket, length: max
  validates :hotel_memo, length: max

  def save
    plan = Plan.create(
      title: title, 
      destination: destination, 
      departure_day: departure_day, 
      return_day: return_day, 
      hotel: hotel, 
      hotel_memo: hotel_memo,
      transportation_id: transportation_id,
      ticket: ticket,
      start_place: start_place,
      group_id: group_id,
      user_id: user_id,
      candidate_id: candidate_id
    )
    DayHow.create(
      passed: 1, 
      plan_id: plan.id,
      user_id: user_id
    )
  end
end