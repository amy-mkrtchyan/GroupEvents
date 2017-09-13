class GroupEvent < ApplicationRecord
  acts_as_paranoid
  attr_accessor :duration

  before_save :strip_input!, :calc_ends_at!
  validates_presence_of :name, :description, :location, :starts_at, :ends_at, on: :publish

  def publish
    update(published: true)
  end

private

  def calc_ends_at!
    self.ends_at ||= starts_at + duration.days if duration
  end

  def strip_input!
    name.try(:strip!)
    description.try(:strip!)
    location.try(:strip!)
  end
end
