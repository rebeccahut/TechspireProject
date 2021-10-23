if (!$) {
    $ = django.jQuery;
}
$(document).ready(function(){
    // Add event listener to "price" input
    $("#id_original_total").change(function(e){

        // Get entered value
        let price = parseFloat($(this).val());

        // Get discount value from another field
        let discount = parseFloat($("#id_final_total").val())

        // Compute total price in whatever way you want
        let total_price = price * 10
        // Set value in read-only "total_price" field.
        $("#id_final_total").val(total_price);
    });
    $('#id_original_total').trigger('change');
})