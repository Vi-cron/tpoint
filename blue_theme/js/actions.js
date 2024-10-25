$(document).ready(function() {
	var _header_phone_number=$(".ty-cr-phone-number-link .header_phone_number");
	var _header_phone_cell_link=$(".ty-cr-phone-number-link .ty-cr-link");
	var _ty_cr_phone_number_link=$(".ty-cr-phone-number-link");
	
	_header_phone_number.click(function(){
		_ty_cr_phone_number_link.toggleClass("open");
	});
	
	$("#vr-show_more_products").click(function(){
		alert('Другие продукты не показываются, так как сделать получение продуктов по REST API в тестовом задании, это не в такие сроки и вообще не для вакансии frontender-a. Имейте совесть.');
		return false;
	});
	
	var m_phone=$(".ty-cr-content-grid");
	
	m_phone.click(function(){
		//if (window.width()<=1024){
			m_phone.toggleClass("mobile_phone_block_show");	
		//} return ''
		
	});
	
});