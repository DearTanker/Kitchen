<?php
/**
 * Twenty Fifteen functions and definitions
 *
 * Set up the theme and provides some helper functions, which are used in the
 * theme as custom template tags. Others are attached to action and filter
 * hooks in WordPress to change core functionality.
 *
 * When using a child theme you can override certain functions (those wrapped
 * in a function_exists() call) by defining them first in your child theme's
 * functions.php file. The child theme's functions.php file is included before
 * the parent theme's file, so the child theme functions would be used.
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
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

/**
 * Set the content width based on the theme's design and stylesheet.
 *
 * @since Twenty Fifteen 1.0
 */
 
// 子主题初始化

add_action( 'wp_enqueue_scripts', 'child_theme_enqueue_styles' );
function child_theme_enqueue_styles() {
    $parenthandle = 'twentyfifteen-style';
    $childhandle = 'twentyfifteen-child-style';
    $theme = wp_get_theme();
    wp_enqueue_style( $parenthandle, get_template_directory_uri() . '/style.css', 
        array(),
        $theme->parent()->get('Version')
    );
    wp_enqueue_style( $childhandle, get_stylesheet_uri(),
        array( $parenthandle ),
        $theme->get('Version')
    );
}

// 取消图片被缩小至2560像素的限制

add_filter( 'big_image_size_threshold', '__return_false' );

// 替换 Gravatar 头像资源为七牛云 CDN

function change_gravatar_url($avatar) {
    $avatar = str_replace(array("www.gravatar.com","cn.gravatar.com", "0.gravatar.com", "1.gravatar.com", "2.gravatar.com", "secure.gravatar.com"), "dn-qiniu-avatar.qbox.me", $avatar);
    return $avatar;
}

add_filter('get_avatar', 'change_gravatar_url');

// 替换 Emoji 资源为 Staticfile CDN

function change_wp_emoji_baseurl($url) {
	return set_url_scheme('//cdn.staticfile.org/twemoji/14.0.2/72x72/');
}

add_filter('emoji_url', 'change_wp_emoji_baseurl');

function change_wp_emoji_svgurl($url) {
	return set_url_scheme('//cdn.staticfile.org/twemoji/14.0.2/svg/');
}

add_filter('emoji_svg_url', 'change_wp_emoji_svgurl');
