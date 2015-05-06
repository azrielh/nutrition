$(document).ready(function() {
  var keyupTimeout;

  $(document).on("keyup", ".search-term", function(){
    clearTimeout(keyupTimeout);
    var self = this;
    keyupTimeout = setTimeout(function() {
      var value = self.value;
      var $form = $(self).parents('.ingredient');
      var callback = function (data) {
        //normalising the data???.................................
        $form.find('.calories-field').val(data[0].nf_calories/data[0].nf_serving_weight_grams);
        $form.find('.total-fat-field').val(data[0].nf_total_fat/data[0].nf_serving_weight_grams);
        $form.find('.saturated-fat-field').val(data[0].nf_saturated_fat/data[0].nf_serving_weight_grams);
        $form.find('.trans-fat-field').val(data[0].nf_trans_fatty_acid/data[0].nf_serving_weight_grams);
        $form.find('.cholesterol-field').val(data[0].nf_cholesterol/data[0].nf_serving_weight_grams);
        $form.find('.sodium-field').val(data[0].nf_sodium/data[0].nf_serving_weight_grams);
        $form.find('.total-carbs-field').val(data[0].nf_total_carbohydrate/data[0].nf_serving_weight_grams);
        $form.find('.dietary-fiber-field').val(data[0].nf_dietary_fiber/data[0].nf_serving_weight_grams);
        $form.find('.sugars-field').val(data[0].nf_sugars/data[0].nf_serving_weight_grams);
        $form.find('.protein-field').val(data[0].nf_protein/data[0].nf_serving_weight_grams);
        $form.find('.vitamin-a-field').val(data[0].nf_vitamin_a_dv/data[0].nf_serving_weight_grams);
        $form.find('.vitamin-c-field').val(data[0].nf_vitamin_c_dv/data[0].nf_serving_weight_grams);
        $form.find('.calcium-field').val(data[0].nf_calcium_dv/data[0].nf_serving_weight_grams);
        $form.find('.iron-field').val(data[0].nf_iron_dv/data[0].nf_serving_weight_grams);
        $form.find('.ingredient-id-field').val(data[0].item_id);
        $form.find('.serving-weight-field').val(data[0].nf_serving_weight_grams);
        // debugger
      };
      search(value, callback);

    }, 500);
  });

  var r_query = {
      "appId":ENV["NUTRITIONIX_API_KEY"],
      "appKey":ENV["NUTRITIONIX_API_SECRET"],
      "fields":"item_name,brand_name,item_id,nf_calories,nf_total_fat,nf_saturated_fat,nf_trans_fatty_acid,nf_cholesterol,nf_sodium,nf_total_carbohydrate,nf_dietary_fiber,nf_sugars,nf_protein,nf_vitamin_a_dv,nf_vitamin_c_dv,nf_calcium_dv,nf_iron_dv,nf_serving_weight_grams,nf_serving_size_qty,nf_serving_size_unit",
      "sort":{
        "field":"_score",
        "order":"desc"
      },
      "filters":{
        "item_type":3
      }
    };

  function search (input, callback) {
    $.ajax({
      url:
      'https://api.nutritionix.com/v1_1/search/' + encodeURIComponent(input),
      type: 'GET',
      data: r_query,
      error: function (data) {
      console.log('error');
      },
      success: function (data) {
        console.log(data);
        var result = data.hits.map(function (datum) { return datum.fields });
        var item_names = result.map(function(datum) { return datum.item_name });
        console.log(item_names);
        callback(result);

        $( ".search-items" ).autocomplete({
          source: item_names,
        });
      }
    });
  }

});
