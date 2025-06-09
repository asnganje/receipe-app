class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def preparation_duration
    return "" if preparation_time.nil?
    "%02d:%02d" % [ preparation_time / 60, preparation_time % 60 ]
  end

  def preparation_duration=(value)
    if value =~ /\A\d{1,2}:\d{2}\z/
      h, m = value.split(":").map(&:to_i)
      self.preparation_time = h * 60 + m
    end
  end

  def cooking_duration
    return "" if cooking_time.nil?
    "%02d:%02d" % [ cooking_time / 60, cooking_time % 60 ]
  end

  def cooking_duration=(value)
    if value =~ /\A\d{1,2}:\d{2}\z/
      h, m = value.split(":").map(&:to_i)
      self.cooking_time = h * 60 + m
    end
  end
end
