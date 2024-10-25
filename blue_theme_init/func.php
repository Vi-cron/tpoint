<?php
function fn_blue_theme_init_get_categories_post(&$categories_list, $params, $lang_code){
	if (empty($params['item_ids'])) return '';
	foreach ($categories_list as $category_id => $category_data) {
		if ($category_data['parent_id']=='0'){
			$product_count = db_get_field("SELECT sum(product_count) as product_count FROM ?:categories WHERE id_path LIKE('?p/%')", $category_data['category_id']);//status = ?s	
			$categories_list[$category_id]['vr_products_count']=$product_count;
		}
	}
}
?>