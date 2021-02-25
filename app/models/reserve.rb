class Reserve < ApplicationRecord

  validates :start_time,  uniqueness: {message: '※他の人が予約済'}
  validates :name,  presence: {message: '※名前を入力してください'}
  validate :start_time_not_sunday
  validate :start_time_not_thursday
  validate :not_past_day


  def start_time_not_sunday
    errors.add(:start_time, '※日曜日は休日です') if start_time.sunday?
  end

  def start_time_not_thursday
    errors.add(:start_time, '※木曜日は休日です') if start_time.thursday?
  end

  def not_past_day
    errors.add(:start_time, '※過去の日付です') if start_time < Date.today
  end
end
