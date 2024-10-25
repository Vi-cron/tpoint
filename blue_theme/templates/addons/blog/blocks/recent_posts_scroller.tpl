{** block-description:blog.recent_posts_scroller **}

{if $items}

{assign var="obj_prefix" value="`$block.block_id`000"}

<div class="ty-mb-l">
	{foreach from=$items item="page"}
	<div class="vr-blog-recent-posts__item">
			{if $page.main_pair}
                <div class="vr-blog-recent-posts__item_image">
                    <a href="{"pages.view?page_id=`$page.page_id`"|fn_url}">
                        {include file="common/image.tpl" obj_id=$page.page_id images=$page.main_pair}
                    </a>
                </div>
				<div class="ty-blog__date float-right">{$page.timestamp|date_format:"%D, %H:%M"}</div>	{*"`$settings.Appearance.date_format`"*}
			{else}	
				<div class="ty-blog__date">{$page.timestamp|date_format:"%D, %H:%M"}</div>
			{/if}

			
            <a href="{"pages.view?page_id=`$page.page_id`"|fn_url}">{$page.page}</a>
    </div>
	{/foreach}
	<div class="vr-btns-main-down">
		<a href="./blog/" class="vr-black-btn">{__('view_all')}</a>
	</div>
</div>
{/if}