$(document).ready(function() {

  $(document).on("keyup", ".search-term", function(){
    console.log($(this).parents(".nested-fields").find(".protein-field").val());
    $(this).parents(".nested-fields").find(".protein-field").val($(this).val());
  });

  var r_query = {
      "appId":"2aeb108e",
      "appKey":"ecadde5cddbbc58d754489cf310ac8fb",
      "fields":"item_name,brand_name,nf_calories,nf_serving_size_qty,nf_serving_weight_grams,nf_serving_size_unit,nf_protein,nf_vitamin_a_dv",
      "sort":{
        "field":"_score",
        "order":"desc"
      },
      "filters":{
        "item_type":3
      }
    };

  var query = "chicken salad";

  $.ajax({
    url:
    'https://api.nutritionix.com/v1_1/search/' + encodeURIComponent(query),
    //'https://api.nutritionix.com/v1_1/search/chicken?results=0:30&fields=item_name,brand_name,item_id,nf_calories,nf_protein,nf_total_fat,nf_serving_weight_grams&appId=d2c25d42&appKey=2658c4be2e37caf1223143041f118274',
    type: 'GET',
    data: r_query,
    //beforeSend: function(xhr) { xhr.setRequestHeader('appId','2aeb108e'); xhr.setRequestHeader('appKey', 'ecadde5cddbbc58d754489cf310ac8fb');
    //},
    error: function (data) {
    console.log(r_query);
    //alert('error');
  },
    success: function (data) {
      console.log(data.hits);
      //console.log(data.hits[2].fields.item_name);
      var template = $('#food-test-template').html();
      //console.log(template);
      for(var i = 0; i < data.hits.length; i++) {
        //console.log(ingredient);
        var ingredient = data.hits[i].fields;
        var html = Mustache.render(template, ingredient);
        $('.food').append(html);
      }
    }
  });


});


//https://api.nutritionix.com/v1_1/search/mcdonalds?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=APPID&appKey=APPKEY
