//= require spree/frontend
//= require store/tab
//= require store/underscore
//= require store/cart_overlay
//= require store/datepicker
//= require jquery-ui/datepicker
//= require store/spree_travel_core_room

function params_data(product_id) {
    product_type = $('ul#search_box_tabs li.active a')[0].name;
    data = {
	   product_id: product_id,
	   product_type: product_type,
    };

    inputs = $('.' + product_type + '_inputs');
    inputs.each(function(index, element) {
	   data[element.id] = element.value;
    });

    selects = $('.' + product_type + '_selects');
    selects.each(function(index, element) {
	   data[element.id] = element.value;
    });

    return data
}

function update_prices() {
    list = $('.ajax-price');
    $.each(list, function(index, object) {
        object = $(object);
        object.html('<img src="/assets/ajax-loader.gif" >');
        product_id = object.attr('data-product-hook');
        fill_cart_hiddens(product_id);
        $.ajax({
            data_type: 'JSON',
            data: params_data(product_id),
            type: 'POST',
            url: '/products/get_ajax_price',
            success: function (result) {
              console.debug(result);
              button_id = $('#add-to-cart-button-' + result.product_id);
              if (result.prices.length == 0) {
                set_button_disabled(button_id, true);
                object.html('No prices available');
              } else {
                prices = result.prices
                if (prices.length > 1) {
                    prices_str = "" + prices[0] + " .. " + prices[prices.length-1];
                } else {
                    prices_str = prices[0];
                }
                object.html(prices_str);
                hidden_id = "#vp_" + product_id;
                $(hidden_id).val(result.variant);
                set_button_disabled(button_id, prices.length != 1);
              };
            },
            error: function() {
              b = $('#add-to-cart-button' + '_' + result.product_id);
              b.attr('disabled', true);
              b.attr('hidden', true);
              b.addClass('disabled');
		      object.html('ERROR');
            }
        });
    });
    return false;
}

function fill_cart_hiddens(product_id) {
    theform = $('#inside-product-cart-form-'+product_id);
    template = $('#template-hidden-'+product_id, theform);
    data = params_data(product_id);
    $.each(data, function(index, val) {
        index_name = index + "_cart_form";
        new_hidden = $('.'+index_name, theform);
        if (new_hidden.length == 0) {
            new_hidden = template.clone();
            new_hidden.attr('name', index);
            new_hidden.attr('class', index_name);
            new_hidden.attr('id', index_name + '_' + product_id);
            theform.append(new_hidden);
        }
        new_hidden.val(val);
    });
}

function set_button_disabled(item_id, bool) {
    if (bool) {
      $(item_id).attr('disabled', true);
      $(item_id).addClass('disabled');
    } else {
      $(item_id).attr('disabled', false);
      $(item_id).removeClass('disabled');
    }
}

$(document).ready(function() {
    //update_prices();
    //$('#search_box_tabs li a').on('click', function(event) {
    //    var v = $(event.target).attr('name');
    //    var v2 = $("#the_default_product_type").val();
    //    $('#the_product_type').val(v);
    //    console.debug("" + v + " <> " + v2);
    //    set_button_disabled('#update_price', v != v2);
    //});

    //$('#the_check_box').on('click', function(event) {
    //    var v = $('#the_check_box').is(':checked');
    //    set_button_disabled('#update_price', v);
    //});

    //$('#the_keywords_box').on('change keyup', function (event) {
    //    var v = $('#the_keywords_box').val();
    //    var v2 =$('#the_keywords_box').data('default');
    //    set_button_disabled('#update_price', v != v2);
    //});

    //$('#update_price').attr('onclick', 'update_prices()');
});
