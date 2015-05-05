$(document).ready(function() {

  $(document).on("keyup", ".search-term", function(){
    var value = this.value;
    var $form = $(this).parents('.ingredient');
    var callback = function (data) {
      //$form
      //$form.find('.calories-field')
      $form.find('.calories-field').val(data[0].nf_calories);
      $form.find('.total-fat-field').val(data[0].nf_total_fat);
      $form.find('.saturated-fat-field').val(data[0].nf_saturated_fat);
      $form.find('.trans-fat-field').val(data[0].nf_trans_fatty_acid);
      $form.find('.cholesterol-field').val(data[0].nf_cholesterol);
      $form.find('.sodium-field').val(data[0].nf_sodium);
      $form.find('.total-carbs-field').val(data[0].nf_total_carbohydrate);
      $form.find('.dietary-fiber-field').val(data[0].nf_dietary_fiber);
      $form.find('.sugars-field').val(data[0].nf_sugars);
      $form.find('.protein-field').val(data[0].nf_protein);
      $form.find('.vitamin-a-field').val(data[0].nf_vitamin_a_dv);
      $form.find('.vitamin-c-field').val(data[0].nf_vitamin_c_dv);
      $form.find('.calcium-field').val(data[0].nf_calcium_dv);
      $form.find('.iron-field').val(data[0].nf_iron_dv);
      $form.find('.ingredient-id-field').val(data[0].item_id);
      $form.find('.serving-weight-field').val(data[0].nf_serving_weight_grams);

      // debugger
    };
    search(value, callback);
    // console.log($(this).parents(".nested-fields").find(".protein-field").val());
    // $(this).parents(".nested-fields").find(".protein-field").val($(this).val());
  });

  var r_query = {
      "appId":"2aeb108e",
      "appKey":"ecadde5cddbbc58d754489cf310ac8fb",
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
      alert('error');
      console.log(r_query);
      },
      success: function (data) {
        var result = data.hits.map(function (datum) { return datum.fields });
        callback(result);
        console.log(data.hits);
        console.log(result);
        var template = $('#food-test-template').html();
        for(var i = 0; i < data.hits.length; i++) {
          var ingredient = data.hits[i].fields;
          var html = Mustache.render(template, ingredient);
          $('.food').append(html);
        }
      }
    });
  }

});
