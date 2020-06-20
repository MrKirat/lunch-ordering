class Food::Menu < ApplicationRecord

  MAX_MENU_COUNT_PER_DAY = 1

  has_many :categories, foreign_key: :food_menu_id
  has_many :items, through: :categories

  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }

  validate :must_be_only_one_per_day, on: :create
  validate :must_be_current, on: :update

  scope :today, -> { where(created_at: Time.zone.now.all_day).order(:created_at) }

  def self.current
    today.first
  end

  def current?
    self.class.today.first == self
  end

  def self.per_last(time_frame)
    where(created_at: Time.zone.now.send("all_#{time_frame}"))
      .order(created_at: :desc)
      .group_by { |menu| menu.created_at.strftime("%Y-%m-%d") }
      .map { |date, menus| [date, menus.first] }.to_h
  end

  protected

  def must_be_only_one_per_day
    errors.add(:base, "Allowed only one menu per day.") if self.class.today.count >= MAX_MENU_COUNT_PER_DAY
  end

  def must_be_current
    errors.add(:base, "Only today's menu is available to be changed.") unless current?
  end
end
