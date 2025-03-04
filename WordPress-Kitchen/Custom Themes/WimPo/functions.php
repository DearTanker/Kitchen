<?php

// 子主题设置

add_action( 'wp_enqueue_scripts', 'child_theme_enqueue' );
function child_theme_enqueue() {
    $parenthandle = 'twentytwentyfour-style';
	$childhandle = 'WimPo';
    $theme = wp_get_theme();
    wp_enqueue_style( $parenthandle, get_template_directory_uri() . '/style.css', 
        array(),
        $theme->parent()->get('Version')
    );
    wp_enqueue_style( $childhandle, get_stylesheet_uri(),
        array( $parenthandle ),
        $theme->get('Version')
    );
    wp_enqueue_script( 'fix_emoji_to_svg', get_stylesheet_directory_uri() . '/wp-emoji-loader.min.tosvg.js', array(), time(), true);
}

// 取消图片被缩小至2560像素的限制

add_filter( 'big_image_size_threshold', '__return_false' );

// 替换 Gravatar 头像资源为七牛云 CDN

function change_gravatar_url($avatar) {
    $avatar = str_replace(array("www.gravatar.com","cn.gravatar.com", "0.gravatar.com", "1.gravatar.com", "2.gravatar.com", "secure.gravatar.com"), "dn-qiniu-avatar.qbox.me", $avatar);
    return $avatar;
}
add_filter( 'get_avatar', 'change_gravatar_url' );

// 替换 Emoji 资源为 BootCDN CDN

function change_wp_emoji_baseurl($url) {
	return set_url_scheme('//cdn.bootcdn.net/ajax/libs/twemoji/15.1.0/72x72/');
}

add_filter('emoji_url', 'change_wp_emoji_baseurl');

function change_wp_emoji_svgurl($url) {
	return set_url_scheme('//cdn.bootcdn.net/ajax/libs/twemoji/15.1.0/svg/');
}

add_filter('emoji_svg_url', 'change_wp_emoji_svgurl');
