{** block-description:tmpl_call_request **}
<div class="ty-cr-phone-number-link">
    <div class="ty-cr-phone">
		<span id="header_phone_number" class="header_phone_number"><bdi>8 (800) 350-70-56</bdi></span>
	</div>
    <div class="ty-cr-link">
		<span class="ty-cr-work">{__("call_request.work_time")}</span>
        {$obj_prefix = "block"}
        {$obj_id = $block.snapping_id|default:0}

        {if $smarty.request.company_id}
            {$href="call_requests.request?obj_prefix=`$obj_prefix`&obj_id=`$obj_id`&company_id=`$company_id`"}
        {else}
            {$href="call_requests.request?obj_prefix=`$obj_prefix`&obj_id=`$obj_id`"}
        {/if}

        {include file="common/popupbox.tpl"
            href=$href
            link_text=__("call_requests.request_call")
            title=__("call_requests.request_call")
            id="call_request_{$obj_prefix}{$obj_id}"
            content=""
        }
    </div>
</div>