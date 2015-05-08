module RecipesHelper

  def fat_content_description(fat_content)
    max_fat = 65
    percent_of_max_fat = (fat_content / max_fat * 100).round(0)
    if percent_of_max_fat > 25
      "Very High Fat Content"
    elsif percent_of_max_fat > 15
      "High Fat Content"
    elsif percent_of_max_fat > 10
      "Average Fat Content"
    elsif percent_of_max_fat > 5
      "Low Fat Content"
    elsif percent_of_max_fat > 0
      "Very Low Fat Content"
    else percent_of_max_fat == 0
      "No Fat Content"
    end
  end

  def sat_fat_content_description(sat_fat_content)
    max_sat_fat = 20
    percent_of_max_fat = (sat_fat_content / max_sat_fat * 100).round(0)
    if percent_of_max_fat > 25
      "Very High Saturated Fat Content"
    elsif percent_of_max_fat > 15
      "High Saturated Fat Content"
    elsif percent_of_max_fat > 10
      "Average Saturated Fat Content"
    elsif percent_of_max_fat > 5
      "Low Saturated Fat Content"
    elsif percent_of_max_fat > 0
      "Very Low Saturated Fat Content"
    else percent_of_max_fat == 0
      "No Saturated Fats"
    end
  end

  def cholesterol_content_description(cholesterol_content)
    max_cholesterol = 0.3
    percent_of_max_fat = (cholesterol_content / max_cholesterol * 100).round(0)
    if percent_of_max_fat > 25
      "Very High Cholesterol Content"
    elsif percent_of_max_fat > 15
      "High Cholesterol Content"
    elsif percent_of_max_fat > 10
      "Average Cholesterol Content"
    elsif percent_of_max_fat > 5
      "Low Cholesterol Content"
    elsif percent_of_max_fat > 0
      "Very Low Cholesterol Content"
    else percent_of_max_fat == 0
      "No Cholesterol"
    end
  end

  def sodium_content_description(sodium_content)
    max_sodium = 2400
    percent_of_max_fat = (sodium_content / max_sodium * 100).round(0)
    if percent_of_max_fat > 25
      "Very High Sodium Content"
    elsif percent_of_max_fat > 15
      "High Sodium Content"
    elsif percent_of_max_fat > 10
      "Average Sodium Content"
    elsif percent_of_max_fat > 5
      "Low Sodium Content"
    elsif percent_of_max_fat > 0
      "Very Low Sodium Content"
    else percent_of_max_fat == 0
      "No Sodium"
    end
  end

  def total_carbs_content_description(carb_content)
    max_carbs = 300
    percent_of_max_fat = (carb_content / max_carbs * 100).round(0)
    if percent_of_max_fat > 25
      "Very High Carbohydrates Content"
    elsif percent_of_max_fat > 15
      "High Carbohydrates Content"
    elsif percent_of_max_fat > 10
      "Average Carbohydrates Content"
    elsif percent_of_max_fat > 5
      "Low Carbohydrates Content"
    elsif percent_of_max_fat > 0
      "Very Low Carbohydrates Content"
    else percent_of_max_fat == 0
      "No Carbohydrates"
    end
  end

end
