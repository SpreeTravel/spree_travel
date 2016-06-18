function params_data_room(product_id, room_id, product_type) {
    data = {
        product_id: product_id,
        product_type: product_type,
        hotel_room: room_id,
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


function fill_cart_hiddens_room(product_id, room_id, rate_id, product_type) {
    theform = $('.inside-room-cart-form-'+room_id+'-'+rate_id);
    template = $('#template-hidden-'+room_id+'-'+rate_id, theform);
    data = params_data_room(product_id, room_id, product_type);
    $.each(data, function(index, val) {
        index_name = index + "_cart_form";
        new_hidden = $('.'+index_name, theform);
        if (new_hidden.length == 0) {
            new_hidden = template.clone();
            new_hidden = template.clone();
            new_hidden.attr('name', index);
            new_hidden.attr('class', index_name);
            new_hidden.attr('id', index_name + '_' + room_id);
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

