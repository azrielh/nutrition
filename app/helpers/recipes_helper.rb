module RecipesHelper

  def weight_per_serving
    (@recipe.total_weight / @recipe.servings).round(1)
  end

  def calories_per_serving
    (@recipe.calories / @recipe.servings).round(0)
  end

  def calories_from_fat_per_serving
    calorie_multiplier = 9
    ((@recipe.total_fat * calorie_multiplier)/@recipe.servings).round(0)
  end

  def total_fat_per_serving
    (@recipe.total_fat/@recipe.servings).round(0)
  end

  def dv_total_fat_per_serving
    max_total_fat = 65
    ((@recipe.total_fat / max_total_fat * 100)/@recipe.servings).round(0)
  end

  def sat_fat_per_serving
    (@recipe.saturated_fat/@recipe.servings).round(0)
  end

  def dv_sat_fat_per_serving
    max_sat_fat = 20
    ((@recipe.saturated_fat / max_sat_fat * 100)/@recipe.servings).round(0)
  end

  def trans_fat_per_serving
    (@recipe.trans_fat/@recipe.servings).round(0)
  end

  def cholesterol_per_serving
    (@recipe.cholesterol/@recipe.servings).round(0)
  end

  def dv_cholesterol_per_serving
    max_cholesterol = 300
    ((@recipe.cholesterol / max_cholesterol * 100)/@recipe.servings).round(0)
  end

  def sodium_per_serving
    (@recipe.sodium/@recipe.servings).round(0)
  end

  def dv_sodium_per_serving
    max_sodium = 2400
    ((@recipe.sodium / max_sodium * 100)/@recipe.servings).round(0)
  end

  def carbs_per_serving
    (@recipe.total_carbs/@recipe.servings).round(0)
  end

  def dv_carbs_per_serving
    max_carbs = 300
    ((@recipe.total_carbs / max_carbs * 100)/@recipe.servings).round(0)
  end

  def dietary_fiber_per_serving
    (@recipe.dietary_fiber/@recipe.servings).round(0)
  end

  def dv_dietary_fiber_per_serving
    max_dietary_fiber = 25
    (@recipe.dietary_fiber / max_dietary_fiber * 100).round(0)
  end

  def sugar_per_serving
    (@recipe.sugars/@recipe.servings).round(0)
  end

  def protein_per_serving
    (@recipe.protein/@recipe.servings).round(0)
  end

  def dv_vitamin_a_per_serving
    (@recipe.vitamin_a/@recipe.servings).round(0)
  end

  def dv_vitamin_c_per_serving
    (@recipe.vitamin_c/@recipe.servings).round(0)
  end

  def dv_calcium_per_serving
    (@recipe.calcium/@recipe.servings).round(0)
  end

  def dv_iron_per_serving
    (@recipe.iron/@recipe.servings).round(0)
  end

  def fat_content_description(dv_fat_content)
    if dv_fat_content > 25
      "Very High Fat Content"
    elsif dv_fat_content > 15
      "High Fat Content"
    elsif dv_fat_content > 10
      "Average Fat Content"
    elsif dv_fat_content > 5
      "Low Fat Content"
    elsif dv_fat_content > 0
      "Very Low Fat Content"
    else dv_fat_content == 0
      "No Fat Content"
    end
  end

  def cholesterol_content_description(dv_cholesterol_content)
    if dv_cholesterol_content > 25
      "Very High Cholesterol Content"
    elsif dv_cholesterol_content > 15
      "High Cholesterol Content"
    elsif dv_cholesterol_content > 10
      "Average Cholesterol Content"
    elsif dv_cholesterol_content > 5
      "Low Cholesterol Content"
    elsif dv_cholesterol_content > 0
      "Very Low Cholesterol Content"
    else dv_cholesterol_content == 0
      "No Cholesterol"
    end
  end

  def sodium_content_description(dv_sodium_content)
    if dv_sodium_content > 25
      "Very High Sodium Content"
    elsif dv_sodium_content > 15
      "High Sodium Content"
    elsif dv_sodium_content > 10
      "Average Sodium Content"
    elsif dv_sodium_content > 5
      "Low Sodium Content"
    elsif dv_sodium_content > 0
      "Very Low Sodium Content"
    else dv_sodium_content == 0
      "No Sodium"
    end
  end

  def total_carbs_content_description(dv_carb_content)
    if dv_carb_content > 25
      "Very High Carbohydrates Content"
    elsif dv_carb_content > 15
      "High Carbohydrates Content"
    elsif dv_carb_content > 10
      "Average Carbohydrates Content"
    elsif dv_carb_content > 5
      "Low Carbohydrates Content"
    elsif dv_carb_content > 0
      "Very Low Carbohydrates Content"
    else dv_carb_content == 0
      "No Carbohydrates"
    end
  end

end
