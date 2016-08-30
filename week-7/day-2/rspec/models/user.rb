class User
  BEST_COLOR = "Blue"
  ENOUGH_COLORS = 3

  attr_accessor :name
  attr_accessor :favorite_colors
  attr_accessor :admin

  def valid?
    if admin
      likes_best_color? && likes_enough_colors?
    else
      likes_best_color?
    end
  end

  private

  def likes_enough_colors?
    favorite_colors.size > ENOUGH_COLORS
  end

  def likes_best_color?
    favorite_colors.include?(BEST_COLOR)
  end
end
