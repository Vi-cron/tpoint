{** block-description:my_account **}
{capture name="title"}
	<a class="ty-account-info__title vr-blue-icon-hover" href="{"profiles.update"|fn_url}">
	<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
	<g clip-path="url(#clip0_22_935)">
	<path fill-rule="evenodd" clip-rule="evenodd" d="M9.53513 13.5331C10.2496 14.0082 11.1073 14.285 12.0296 14.285C12.9519 14.285 13.8095 14.0082 14.524 13.5331C15.7395 12.725 16.5407 11.343 16.5407 9.77395C16.5407 7.28258 14.5209 5.26292 12.0296 5.26292C9.5382 5.26292 7.51855 7.28258 7.51855 9.77395C7.51855 11.343 8.31964 12.725 9.53513 13.5331ZM12.0296 12.0295C13.2753 12.0295 14.2851 11.0196 14.2851 9.77395C14.2851 8.52826 13.2753 7.51844 12.0296 7.51844C10.7839 7.51844 9.77407 8.52826 9.77407 9.77395C9.77407 11.0196 10.7839 12.0295 12.0296 12.0295Z" />
	<path fill-rule="evenodd" clip-rule="evenodd" d="M24.0588 12.0293C24.0588 18.673 18.6731 24.0587 12.0294 24.0587C5.38575 24.0587 0 18.673 0 12.0293C0 5.38564 5.38575 -0.000109673 12.0294 -0.000109673C18.6731 -0.000109673 24.0588 5.38564 24.0588 12.0293ZM17.292 20.2669C15.7728 21.2395 13.967 21.8032 12.0294 21.8032C10.0918 21.8032 8.28584 21.2393 6.76671 20.2669C6.7842 19.0363 7.78722 18.044 9.022 18.044H15.0367C16.2714 18.044 17.2745 19.0363 17.292 20.2669ZM19.2314 18.6369C18.5805 16.9958 16.9942 15.8274 15.1304 15.7894C15.0993 15.7888 15.068 15.7885 15.0367 15.7885H9.022C8.99066 15.7885 8.95938 15.7888 8.9282 15.7894C7.06447 15.8274 5.4783 16.9958 4.82728 18.6368C3.2303 16.8971 2.25551 14.577 2.25551 12.0293C2.25551 6.63133 6.63144 2.2554 12.0294 2.2554C17.4275 2.2554 21.8033 6.63133 21.8033 12.0293C21.8033 14.5771 20.8285 16.8972 19.2314 18.6369Z"/>
	</g>
	<defs>
	<clipPath id="clip0_22_935">
	<rect width="24.0588" height="24.0588" fill="white"/>
	</clipPath>
	</defs>
	</svg>
	</a>
{/capture}

{*capture name="title"}
    <a class="ty-account-info__title" href="{"profiles.update"|fn_url}">
        {include_ext file="common/icon.tpl" class="ty-icon-user"}&nbsp;<span class="ty-account-info__title-txt" {live_edit name="block:name:{$block.block_id}"}>{$title}</span>
        {include_ext file="common/icon.tpl" class="ty-icon-down-micro ty-account-info__user-arrow"}
    </a>
{/capture*}

<div id="account_info_{$block.snapping_id}">
    {assign var="return_current_url" value=$config.current_url|escape:url}
    <ul class="ty-account-info">
        {hook name="profiles:my_account_menu"}
            {if $auth.user_id}
                {if $user_info.firstname || $user_info.lastname}
                    <li class="ty-account-info__item  ty-account-info__name ty-dropdown-box__item">{$user_info.firstname} {$user_info.lastname}</li>
                {else}
                    <li class="ty-account-info__item ty-dropdown-box__item ty-account-info__name">{$user_info.email}</li>
                {/if}
                <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a underlined" href="{"profiles.update"|fn_url}" rel="nofollow" >{__("profile_details")}</a></li>
                {if $settings.General.enable_edp == "Y"}
                <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a underlined" href="{"orders.downloads"|fn_url}" rel="nofollow">{__("downloads")}</a></li>
                {/if}
            {elseif $user_data.firstname || $user_data.lastname}
                <li class="ty-account-info__item  ty-dropdown-box__item ty-account-info__name">{$user_data.firstname} {$user_data.lastname}</li>
            {elseif $user_data.email}
                <li class="ty-account-info__item ty-dropdown-box__item ty-account-info__name">{$user_data.email}</li>
            {/if}
            <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a underlined" href="{"orders.search"|fn_url}" rel="nofollow">{__("orders")}</a></li>
            {if $settings.General.enable_compare_products == 'Y'}
                {$compared_products_ids = $smarty.session.comparison_list}
                <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a underlined" href="{"product_features.compare"|fn_url}" rel="nofollow">{__("view_comparison_list")}{if $compared_products_ids} ({$compared_products_ids|count}){/if}</a></li>
            {/if}
        {/hook}
    </ul>

    {if $settings.Appearance.display_track_orders == 'Y'}
        <div class="ty-account-info__orders updates-wrapper track-orders" id="track_orders_block_{$block.snapping_id}">
            <form action="{""|fn_url}" method="POST" class="cm-ajax cm-post cm-ajax-full-render" name="track_order_quick">
                <input type="hidden" name="result_ids" value="track_orders_block_*" />
                <input type="hidden" name="return_url" value="{$smarty.request.return_url|default:$config.current_url}" />

                <div class="ty-account-info__orders-txt">{__("track_my_order")}</div>

                <div class="ty-account-info__orders-input ty-control-group ty-input-append">
                    <label for="track_order_item{$block.snapping_id}" class="cm-required hidden">{__("track_my_order")}</label>
                    <input type="text" size="20" class="ty-input-text cm-hint" id="track_order_item{$block.snapping_id}" name="track_data" value="{__("order_id")}{if !$auth.user_id}/{__("email")}{/if}" />
                    {include file="buttons/go.tpl" but_name="orders.track_request" alt=__("go")}
                    {include file="common/image_verification.tpl" option="track_orders" align="left" sidebox=true}
                </div>
            </form>
        <!--track_orders_block_{$block.snapping_id}--></div>
    {/if}

    <div class="ty-account-info__buttons buttons-container">
        {if $auth.user_id}
            {$is_vendor_with_active_company="MULTIVENDOR"|fn_allowed_for && ($auth.user_type == "V") && ($auth.company_status == "A")}
            {if $is_vendor_with_active_company}
                <a href="{fn_url("bottom_panel.login_as_vendor?url=`$config.current_url|urlencode`&area={"SiteArea::STOREFRONT"|enum}&user_id=`$auth.user_id`")}" rel="nofollow" class="ty-btn ty-btn__primary cm-post" target="_blank">{__("go_to_admin_panel")}</a>
            {/if}
            <a href="{"auth.logout?redirect_url=`$return_current_url`"|fn_url}" rel="nofollow" class="ty-btn {if $is_vendor_with_active_company}ty-btn__tertiary{else}ty-btn__primary{/if}">{__("sign_out")}</a>
        {else}
            <a href="{if $runtime.controller == "auth" && $runtime.mode == "login_form"}{$config.current_url|fn_url}{else}{"auth.login_form?return_url=`$return_current_url`"|fn_url}{/if}" data-ca-target-id="login_block{$block.snapping_id}" class="cm-dialog-opener cm-dialog-auto-size ty-btn ty-btn__secondary" rel="nofollow">{__("sign_in")}</a><a href="{"profiles.add"|fn_url}" rel="nofollow" class="ty-btn ty-btn__primary">{__("register")}</a>
            <div  id="login_block{$block.snapping_id}" class="hidden" title="{__("sign_in")}">
                <div class="ty-login-popup">
                    {include file="views/auth/login_form.tpl" style="popup" id="popup`$block.snapping_id`"}
                </div>
            </div>
        {/if}
    </div>
<!--account_info_{$block.snapping_id}--></div>
