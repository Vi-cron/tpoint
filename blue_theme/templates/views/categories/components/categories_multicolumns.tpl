{$block.properties.not_scroll_automatically="Y"}

{$block.properties.outside_navigation = "Y"}
{$block.properties.scroll_per_page = "N"}
{$block.properties.speed = 400}
{$block.properties.pause_delay = 3}
{$block.properties.item_quantity = 5}


{$obj_prefix="`$block.block_id`000"}
{$block.block_id = "{$block.block_id}_{uniqid()}"}
{$item_quantity = 3}{*$block.properties.item_quantity|default:5*}
{$item_quantity_desktop = $item_quantity}
{$item_quantity_mobile = 1}

{if $item_quantity > 3}
    {$item_quantity_desktop_small = $item_quantity - 1}
    {$item_quantity_tablet = $item_quantity - 2}
{elseif $item_quantity === 1}
    {$item_quantity_desktop_small = $item_quantity}
    {$item_quantity_tablet = $item_quantity}
{else}
    {$item_quantity_desktop_small = $item_quantity - 1}
    {$item_quantity_tablet = $item_quantity - 1}
{/if}

<div class="ty-subcategories">
	{if $block.properties.outside_navigation == "Y"}
	<div class="owl-theme ty-owl-controls">
        <div class="owl-controls clickable owl-controls-outside"  id="owl_outside_nav_{$block.block_id}">
            <div class="owl-buttons">
                <div id="owl_prev_{$obj_prefix}" class="owl-prev">{include_ext file="common/icon.tpl" class="ty-icon-left-open-thin"}</div>
                <div id="owl_next_{$obj_prefix}" class="owl-next">{include_ext file="common/icon.tpl" class="ty-icon-right-open-thin"}</div>
            </div>
        </div>
    </div>
	{/if}
	<div id="scroll_list_{$block.block_id}" class="owl-carousel ty-scroller-list ty-scroller ty-subcategories-block"
		data-ca-scroller-item="{$item_quantity}"
		data-ca-scroller-item-desktop="{$item_quantity_desktop}"
		data-ca-scroller-item-desktop-small="{$item_quantity_desktop_small}"
		data-ca-scroller-item-tablet="{$item_quantity_tablet}"
		data-ca-scroller-item-mobile="{$item_quantity_mobile}"
	>
	
    {foreach from=$categories item="category"}
        <div class="ty-scroller-list__item ty-scroller__item ty-subcategories-block__item">
			<a href="{if $href}{$href}{else}{"categories.view?category_id=`$category.category_id`"|fn_url}{/if}" class="ty-subcategories-block__a">
                {if $category.main_pair}
                    <span class="icon">
                                {include file="common/image.tpl"
                                    show_detailed_link=false
                                    images=$category.main_pair
                                    no_ids=true
                                    image_id="category_image"
                                    image_width=146
                                    image_height=146 
                                    class="ty-subcategories-img"
                                }
                    </span>
                {/if}
                {$category.category}
                {if $category.vr_products_count}
                    <span class="products_count">{__("n_products",array($category.vr_products_count))} </span>
                {/if}
            </a>
		</div>
	{/foreach}
	</div>
</div>
{include file="common/scroller_init.tpl" prev_selector="#owl_prev_`$obj_prefix`" next_selector="#owl_next_`$obj_prefix`"}
