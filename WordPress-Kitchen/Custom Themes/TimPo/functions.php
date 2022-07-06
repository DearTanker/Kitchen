<?php
/**
 * TimPo functions and definitions
 *
 * Set up the theme and provides some helper functions, which are used in the
 * theme as custom template tags. Others are attached to action and filter
 * hooks in WordPress to change core functionality.
 *
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 * @link https://developer.wordpress.org/themes/advanced-topics/child-themes/
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are
 * instead attached to a filter or action hook.
 *
 * For more information on hooks, actions, and filters,
 * {@link https://developer.wordpress.org/plugins/}
 *
 */

function mychildtheme_enqueue_styles() {
       wp_enqueue_style( 'parent-style', get_template_directory_uri() . '/style.css' );
}
add_action( 'wp_enqueue_scripts', 'mychildtheme_enqueue_styles' );

// 替换 Gravatar 头像资源为七牛云

function change_gravatar_url($avatar) {
    $avatar = str_replace(array("www.gravatar.com","cn.gravatar.com", "0.gravatar.com", "1.gravatar.com", "2.gravatar.com", "secure.gravatar.com"), "dn-qiniu-avatar.qbox.me", $avatar);
    return $avatar;
}
add_filter('get_avatar', 'change_gravatar_url');

// 替换 Emoji PNG 资源为 jsDeliver

function change_wp_emoji_baseurl($url) {
	return set_url_scheme('//cdn.jsdelivr.net/gh/twitter/twemoji@latest/assets/72x72/');
}
add_filter('emoji_url', 'change_wp_emoji_baseurl');
 
// 替换 Emoji SVG 资源为 jsDeliver

function change_wp_emoji_svgurl($url) {
	return set_url_scheme('//cdn.jsdelivr.net/gh/twitter/twemoji@latest/assets/svg/');
}
add_filter('emoji_svg_url', 'change_wp_emoji_svgurl');
