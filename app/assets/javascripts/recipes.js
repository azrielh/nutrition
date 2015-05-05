$(document).ready(function() {

  $(document).on("keyup", ".search-term", function(){
    var value = this.value;
    var $form = $(this).parents('.ingredient');
    var callback = function (data) {
      //$form
      //$form.find('.calories-field')
      //$form.find('.calories-field').val(data[0].nf_calories)

      //debugger
    };
    search(value, callback);
    // console.log($(this).parents(".nested-fields").find(".protein-field").val());
    // $(this).parents(".nested-fields").find(".protein-field").val($(this).val());
  });

  var r_query = {
      "appId":"2aeb108e",
      "appKey":"ecadde5cddbbc58d754489cf310ac8fb",
      "fields":"item_name,brand_name,item_id,nf_calories,nf_total_fat,nf_saturated_fat,nf_trans_fatty_acid,nf_cholesterol,nf_sodium,nf_total_carbohydrate,nf_dietary_fiber,nf_sugars,nf_protein,nf_vitamin_a_dv,nf_vitamin_c_nv,nf_calcium_dv,nf_iron_dv,nf_serving_weight_grams,nf_serving_size_qty,nf_serving_size_unit",
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
