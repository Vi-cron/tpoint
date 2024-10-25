{assign var="dropdown_id" value=$block.snapping_id}
{assign var="r_url" value=$config.current_url|escape:url}
{hook name="checkout:cart_content"}
    <div class="ty-dropdown-box vr-blue-icon-hover" id="cart_status_{$dropdown_id}">
         <div id="sw_dropdown_{$dropdown_id}" class="ty-dropdown-box__title cm-combination">
			<a href="{"checkout.cart"|fn_url}">
            {hook name="checkout:dropdown_title"}

				<svg width="29" height="29" viewBox="0 0 29 29" xmlns="http://www.w3.org/2000/svg">
				<g clip-path="url(#clip0_22_943)">
					<path d="M26.6273 3.50851C27.3259 3.50851 27.8103 4.20518 27.567 4.86006L27.4429 5.19421C27.297 5.58698 26.9222 5.84757 26.5032 5.84757H25.3208C25.0977 5.84757 24.9014 5.99507 24.8394 6.20941L21.0907 19.1582C20.9666 19.5869 20.5741 19.8819 20.1278 19.8819H6.06438C5.66058 19.8819 5.29621 19.6396 5.13999 19.2672L0.583772 8.40737C0.306621 7.74677 0.791783 7.01709 1.50816 7.01709H18.3383C19.0029 7.01709 19.4835 7.65199 19.3031 8.29162L19.2089 8.62577C19.0871 9.05777 18.6929 9.35614 18.2441 9.35614H4.27228C3.91408 9.35614 3.6715 9.72099 3.81009 10.0513L6.82438 17.2355C6.9025 17.4217 7.08468 17.5428 7.28658 17.5428H18.7712C18.9949 17.5428 19.1915 17.3945 19.2531 17.1794L22.9551 4.23532C23.0781 3.80509 23.4714 3.50851 23.9189 3.50851H26.6273ZM9.94146 21.0514C8.97309 21.0514 8.18717 21.8373 8.18717 22.8057C8.18717 23.7752 8.97309 24.56 9.94146 24.56C10.9098 24.56 11.6957 23.7752 11.6957 22.8057C11.6957 21.8373 10.9098 21.0514 9.94146 21.0514ZM15.7891 21.0514C14.8207 21.0514 14.0348 21.8362 14.0348 22.8057C14.0348 23.7752 14.8207 24.56 15.7891 24.56C16.7575 24.56 17.5434 23.7752 17.5434 22.8057C17.5434 21.8373 16.7575 21.0514 15.7891 21.0514Z"/>
				</g>
				<defs>
				<clipPath id="clip0_22_943">
				<rect width="28.0686" height="28.0686"/>
				</clipPath>
				</defs>
				</svg>
				
				{if $smarty.session.cart.amount}
				<div class="vr-mini-card-amount">{$smarty.session.cart.amount}</dvi>
				{/if}
			</div>

			
			{*
                {if $smarty.session.cart.amount}
                    {include_ext file="common/icon.tpl"
                        class="ty-icon-cart ty-minicart__icon filled"
                    }
                    <span class="ty-minicart-title ty-hand">{$smarty.session.cart.amount}&nbsp;{__("items")} {__("for")}&nbsp;{include file="common/price.tpl" value=$smarty.session.cart.display_subtotal}</span>
                    {include_ext file="common/icon.tpl" class="ty-icon-down-micro"}
                {else}
                    {include_ext file="common/icon.tpl"
                        class="ty-icon-cart ty-minicart__icon empty"
                    }
                    <span class="ty-minicart-title empty-cart ty-hand">{__("cart_is_empty")}</span>
                    {include_ext file="common/icon.tpl" class="ty-icon-down-micro"}
                {/if}
			*}	
            {/hook}
        </a>
        </div>
        <div id="dropdown_{$dropdown_id}" class="cm-popup-box ty-dropdown-box__content ty-dropdown-box__content--cart hidden">
            {hook name="checkout:minicart"}
                <div class="cm-cart-content {if $block.properties.products_links_type == "thumb"}cm-cart-content-thumb{/if} {if $block.properties.display_delete_icons == "Y"}cm-cart-content-delete{/if}">
                        <div class="ty-cart-items">
                            {if $smarty.session.cart.amount}
                                <ul class="ty-cart-items__list">
                                    {hook name="index:cart_status"}
                                        {assign var="_cart_products" value=$smarty.session.cart.products|array_reverse:true}
                                        {foreach from=$_cart_products key="key" item="product" name="cart_products"}
                                            {hook name="checkout:minicart_product"}
                                            {if !$product.extra.parent}
                                                <li class="ty-cart-items__list-item">
                                                    {hook name="checkout:minicart_product_info"}
                                                    {if $block.properties.products_links_type == "thumb"}
                                                        <div class="ty-cart-items__list-item-image">
                                                            {include file="common/image.tpl" image_width="40" image_height="40" images=$product.main_pair no_ids=true}
                                                        </div>
                                                    {/if}
                                                    <div class="ty-cart-items__list-item-desc">
                                                        <a href="{"products.view?product_id=`$product.product_id`"|fn_url}">{$product.product|default:fn_get_product_name($product.product_id) nofilter}</a>
                                                    <p>
                                                        <span>{$product.amount}</span><span dir="{$language_direction}">&nbsp;x&nbsp;</span>{include file="common/price.tpl" value=$product.display_price span_id="price_`$key`_`$dropdown_id`" class="none"}
                                                    </p>
                                                    </div>
                                                    {if $block.properties.display_delete_icons == "Y"}
                                                        <div class="ty-cart-items__list-item-tools cm-cart-item-delete">
                                                            {if (!$runtime.checkout || $force_items_deletion) && !$product.extra.exclude_from_calculate}
                                                                {include file="buttons/button.tpl" but_href="checkout.delete.from_status?cart_id=`$key`&redirect_url=`$r_url`" but_meta="cm-ajax cm-ajax-full-render" but_target_id="cart_status*" but_role="delete" but_name="delete_cart_item"}
                                                            {/if}
                                                        </div>
                                                    {/if}
                                                    {/hook}
                                                </li>
                                            {/if}
                                            {/hook}
                                        {/foreach}
                                    {/hook}
                                </ul>
                            {else}
                                <div class="ty-cart-items__empty ty-center">{__("cart_is_empty")}</div>
                            {/if}
                        </div>

                        {if $block.properties.display_bottom_buttons == "Y"}
                        <div class="cm-cart-buttons ty-cart-content__buttons buttons-container{if $smarty.session.cart.amount} full-cart{else} hidden{/if}">
                            <div class="ty-float-left">
                                <a href="{"checkout.cart"|fn_url}" rel="nofollow" class="ty-btn ty-btn__secondary">{__("view_cart")}</a>
                            </div>
                            {if $settings.Checkout.checkout_redirect != "Y"}
                            <div class="ty-float-right">
                                {include file="buttons/proceed_to_checkout.tpl" but_text=__("checkout")}
                            </div>
                            {/if}
                        </div>
                        {/if}

                </div>
            {/hook}
        </div>
    <!--cart_status_{$dropdown_id}--></div>
{/hook}
