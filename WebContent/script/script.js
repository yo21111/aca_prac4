/**
 * 
 */
$(function() {
	$("span.afterSale").each(function(i, v) {
		let price = Number($(this).text());
		price = price.toLocaleString();
		$(this).text(price);
	});

	$("span.beforeSale").each(function(i, v) {
		let price = Number($(this).text());
		price = price.toLocaleString();
		$(this).text(price);
	});

});