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
    order_total = line_totals.reduce(function (accumulator, current) {
        return accumulator + current;
    });
    order_total = "$" + parseFloat(order_total).toFixed(2)
    $(".field-final_total div div").text(order_total)
    $(".field-original_total div div").text(order_total)

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



function update_emps(){
        update_products()
        var url = $("#Emp_URL").attr("data-url");  // get the url of the `load_cities` view
        var storeID = $("#id_store").val();  // get the selected country ID from the HTML input
        var target_element = $("#id_employee")
        var empID = target_element.val();
        $.ajax({                       // initialize an AJAX request
            url: url,                    // set the url of the request (= localhost:8000/hr/ajax/load-cities/)
            data: {
              'store': storeID       // add the country id to the GET parameters
            },
            success: function (data) {   // `data` is the return of the `load_cities` view function
              target_element.html(data);  // replace the contents of the city input with the data that came from the server
              target_element.val(empID)
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

function convert_money_inline(element_id){
    $('[id^="orderline_set-"]').children("td").filter(element_id).children("p").each(function () {
        $(this).text("$" + parseFloat($(this).text()).toFixed(2))
    })

}

function convert_money(element){
    var target_element = $("." + element + " div div")
    target_element.text("$" + parseFloat(target_element.text()).toFixed(2))
}


$(document).ready(function(){

    //$('[id^="orderline_set-"]').children("td").filter(".field-ind_price").children("p").each(function () {
        //$(this).text("$" + parseFloat($(this).text()).toFixed(2))
   // })

    DJQ(document).on('formset:removed', function(event, row, formsetName) {
        update_order_total()
    });


    convert_money_inline(".field-ind_price")
    convert_money_inline(".field-total_price")
    convert_money("field-original_total")
    convert_money("field-discount_amount")
    convert_money("field-final_total")
    update_emps()

    var store_binding = $("#id_store").change(update_emps);

    $("tbody").on("change", '[id^="id_orderline_set-"][id$="-quantity"]', function(){
        line_num = this.id.substring(17,18)
        update_line_total(line_num)
    })

    $("tbody").on("change", '[id^="id_orderline_set-"][id$="-product"]', function(){
        var url = $("#Product_Price_URL").attr("data-url");  // get the url of the `load_cities` view
        var productID = $(this).val()
        var target_element = this
        //$("#id_store").val();  // get the selected country ID from the HTML input
        $.ajax({                       // initialize an AJAX request
            url: url,                    // set the url of the request (= localhost:8000/hr/ajax/load-cities/)
            data: {
              'product': productID       // add the country id to the GET parameters
            },
            success: function (data) {
                var text = parseFloat(data).toFixed(2)
                var line_num = target_element.id.substring(17,18)
                var id_name = "orderline_set-" + line_num
                var query = "#" + id_name + " " + ".field-ind_price" + " p"
                $(query).text("$" + text)
                update_line_total(line_num)
            }
        })
    })


})