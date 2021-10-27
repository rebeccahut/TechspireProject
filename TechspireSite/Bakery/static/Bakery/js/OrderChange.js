DJQ = django.jQuery;



function update_order_total(){
    console.log("fired")
    var order_total = 0
    var line_totals = []
     $(".field-total_price p").each(function(){
        let line_total = $(this).text()
        line_total = line_total.substring(1)
        line_total = Number(parseFloat(line_total).toFixed(2))
        line_totals.push(line_total)
     })

     var discount = 0
     $(".field-discount_amount p").each(function(){
        num = parseInt($(this).text().substring(1))
        discount += num
     })

     var points_consumed = 0
     $(".field-point_cost p").each(function(){
        num = parseInt($(this).text())
        points_consumed += num
     })


    order_total = line_totals.reduce(function (accumulator, current) {
        return accumulator + current;
    });
    points_produced = (Math.floor(parseFloat(order_total) / 5)).toFixed(0)
    points_total = points_produced - points_consumed
    final_total = order_total - discount

    //Format as money
    final_total = format_money(final_total)
    order_total = format_money(order_total)
    discount = format_money(discount)

    //Update elements
    $(".field-final_total div div").text(final_total)
    $(".field-original_total div div").text(order_total)
    $(".field-eligible_for_points div div").text(final_total)
    $(".field-points_produced div div").text(points_produced)
    $(".field-discount_amount div div").text(discount)
    $(".field-points_total div div").text(points_total)
    $(".field-points_consumed div div").text(points_consumed)
}

function update_products(){
        var url = $("#Product_URL").attr("data-url");  // get the url of the `load_cities` view
        var storeID = $("#id_store").val();  // get the selected country ID from the HTML input
        var selected = []

        $('[id^="id_orderline_set-"]').filter('[id$="-product"]').each(function(){
            selected.push($(this).val());
        });
        $.ajax({                       // initialize an AJAX request
            url: url,                    // set the url of the request (= localhost:8000/hr/ajax/load-cities/)
            data: {
              'store': storeID       // add the country id to the GET parameters
            },
            success: function (data) {
                $('[id^="id_orderline_set-"]').filter('[id$="-product"]').each(function(index){
                    $(this).html(data)
                    $(this).val(selected[index])
                    if ($(this).val() == null) {
                        $(this).val("")
                        var text = parseFloat("0").toFixed(2)
                        line_num = $(this).attr('id').substring(17,18)
                        var id_name = "orderline_set-" + line_num
                        var query = "#" + id_name + " " + ".field-ind_price" + " p"
                        console.log(query)
                        $(query).text("$" + text)
                        update_line_total(line_num)

                    }
                });
            }
        })
}

function update_rewards(){
    var url = $("#Reward_URL").attr("data-url");  // get the url of the `load_cities` view
        var storeID = $("#id_store").val();  // get the selected country ID from the HTML input
        var selected = []
        $('[id^="id_customerreward_set-"]').filter('[id$="-reward"]').each(function(){
            selected.push($(this).val());
        });
        $.ajax({                       // initialize an AJAX request
            url: url,                    // set the url of the request (= localhost:8000/hr/ajax/load-cities/)
            data: {
              'store': storeID       // add the country id to the GET parameters
            },
            success: function (data) {
                $('[id^="id_customerreward_set-"]').filter('[id$="-reward"]').each(function(index){
                    console.log(index)
                    $(this).html(data)
                    $(this).val(selected[index])
                    if ($(this).val() == null) {
                        $(this).val("")
                        update_reward_line(0, convert_money(0), "None", index)
                    }
                });
            }
        })
}

function update_emps(){
        var url = $("#Emp_URL").attr("data-url");
        var storeID = $("#id_store").val();
        var target_element = $("#id_employee")
        var empID = target_element.val();
        $.ajax({
            url: url,
            data: {
              'store': storeID
            },
            success: function (data) {
              target_element.html(data);
              target_element.val(empID)
              //If selected option doesn't exsist reset it to blank
              if (target_element.val() == null) {
                target_element.val("")
              }
            }
    })
}

function update_line_total(line_num){
    var total_id = "orderline_set-" + line_num
    var total_query = "#" + total_id + " " + ".field-total_price" + " p"
    var ind_id = "orderline_set-" + line_num
    var ind_query = "#" + ind_id + " " + ".field-ind_price" + " p"
    var price = $(ind_query).text()
    price = price.substr(1)
    price = parseFloat(price).toFixed(2)
    var qty_query = "#" + "id_orderline_set-" + line_num + "-quantity"
    var qty = $(qty_query).val()
    total = price * qty
    total_text = "$" + parseFloat(total).toFixed(2)
    $(total_query).text(total_text)
    update_order_total()
    return total

}

function convert_money_inline(element_id, parent_element="orderline"){
    parent_element_query = '[id^=' + parent_element + '_set-]'
    $(parent_element_query).children("td").filter(element_id).children("p").each(function () {
        $(this).text("$" + parseFloat($(this).text()).toFixed(2))
    })

}

function convert_money(element){
    var target_element = $("." + element + " div div")
    target_element.text("$" + parseFloat(target_element.text()).toFixed(2))
}

function update_on_store(){
    update_products()
    update_rewards()
    update_emps()
}

function format_money(input){
    return "$" + parseFloat(input).toFixed(2)
}

$(document).ready(function(){

    //Update totals when an OrderLine or reward is removed
    DJQ(document).on('formset:removed', function(event, row, formsetName) {
        update_order_total()
    });

    convert_money_inline(".field-ind_price")
    convert_money_inline(".field-total_price")
    convert_money_inline(".field-discount_amount", parent_element="customerreward")
    convert_money("field-original_total")
    convert_money("field-discount_amount")
    convert_money("field-final_total")
    convert_money("field-eligible_for_points")
    update_on_store()

    //Update Employee/Product/Reward dropdown when Store is changed
    var store_binding = $("#id_store").change(update_on_store);

    //When quantity changes update line_total and order_total
    $("tbody").on("change", '[id^="id_orderline_set-"][id$="-quantity"]', function(){
        line_num = this.id.substring(17,18)
        update_line_total(line_num)
    })

    //When product changes update ind_price, line_total, order_total
    $("tbody").on("change", '[id^="id_orderline_set-"][id$="-product"]', function(){
        var url = $("#Product_Price_URL").attr("data-url");
        var productID = $(this).val()
        var target_element = this
        $.ajax({
            url: url,
            data: {
              'product': productID
            },
            success: function (data) {
                //Update ind_price
                var text = parseFloat(data).toFixed(2)
                var line_num = target_element.id.substring(17,18)
                var id_name = "orderline_set-" + line_num
                var query = "#" + id_name + " " + ".field-ind_price" + " p"
                $(query).text("$" + text)
                update_line_total(line_num)
            }
        })
    })

    //When product changes update ind_price, line_total, order_total
    $("tbody").on("change", '[id^="id_orderline_set-"][id$="-product"]', function(){
        var url = $("#Product_Price_URL").attr("data-url");
        var productID = $(this).val()
        var target_element = this
        $.ajax({
            url: url,
            data: {
              'product': productID
            },
            success: function (data) {
                //Update ind_price
                var text = parseFloat(data).toFixed(2)
                var line_num = target_element.id.substring(17,18)
                var id_name = "orderline_set-" + line_num
                var query = "#" + id_name + " " + ".field-ind_price" + " p"
                $(query).text("$" + text)
                update_line_total(line_num)
            }
        })
    })

    //When product changes update ind_price, line_total, order_total
    $("tbody").on("change", '[id^="id_customerreward_set-"][id$="-reward"]', function(){
        var url = $("#Reward_Details_URL").attr("data-url");
        var rewardID = $(this).val()
        var target_element = this
        $.ajax({
            url: url,
            data: {
              'reward': rewardID
            },
            success: function (data) {
                var line_num = target_element.id.substring(22,23)
                update_reward_line(data.cost, data.discount, data.product, line_num)
                update_order_total()
            }
        })
    })
})


function update_reward_line(cost,discount,product, line){
    var id_name = "customerreward_set-" + line
    var cost_select = "#" + id_name + " " + ".field-point_cost" + " p"
    var discount_select = "#" + id_name + " " + ".field-discount_amount" + " p"
    var product_select = "#" + id_name + " " + ".field-free_product" + " p"
    $(cost_select).text(cost)
    $(discount_select).text(format_money(discount))
    $(product_select).text(product)
}