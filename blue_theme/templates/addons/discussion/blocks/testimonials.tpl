{** block-description:discussion_title_home_page **}

{assign var="discussion" value=0|fn_get_discussion:"E":true:$block.properties}
{*items_per_page:1*}

{if $discussion && $discussion.type != "D" && $discussion.posts}

{assign var="obj_prefix" value="`$block.block_id`000"}

<div class="ty-mb-l vr-main-discussion">
	{foreach from=$discussion.posts item=post}
	<div class="ty-discussion-post__content vr-main-discussion-post__content">
            {hook name="discussion:items_list_row"}
                <span class="ty-discussion-post__author">{$post.name}</span>
                <span class="ty-discussion-post__date">{$post.timestamp|date_format:"`$settings.Appearance.date_format`"}</span>
                {if $discussion.type == "R" || $discussion.type == "B" && $post.rating_value > 0}
                    <div class="clearfix ty-discussion-post__rating">
                        {include file="addons/discussion/views/discussion/components/stars.tpl" stars=$post.rating_value|fn_get_discussion_rating}
                    </div>
                {/if}
				
				<a href="{"discussion.view?thread_id=`$discussion.thread_id`&post_id=`$post.post_id`"|fn_url}#post_{$post.post_id}">
                    <div class="ty-discussion-post {cycle values=", ty-discussion-post_even"}" id="post_{$post.post_id}">

                        {if $discussion.type == "C" || $discussion.type == "B"}
                        <div class="ty-discussion-post__message">{$post.message|truncate:100|nl2br nofilter}</div>
                        {/if}

                        <span class="ty-caret-bottom"><span class="ty-caret-outer"></span><span class="ty-caret-inner"></span></span>

                    </div>
                </a>
				
            {/hook}
    </div>
{/foreach}
	<div class="discussion-btns vr-btns-main-down">
	{$view_all=__('view_all')}
	<a href="{"discussion.view?thread_id=`$discussion.thread_id`&post_id=`$post.post_id`"|fn_url}" class="vr-black-btn">{$view_all|ucfirst}</a>
	{if $discussion.type !== "Addons\\Discussion\\DiscussionTypes::TYPE_DISABLED"|enum}
        {include
            file="addons/discussion/views/discussion/components/new_post_button.tpl"
            name=__("write_review")
            obj_id=$object_id
            object_type=$discussion.object_type
            locate_to_review_tab=$locate_to_review_tab
        }
    {/if}
	</div>
</div>
{/if}