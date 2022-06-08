<?php

add_action( 'wp_enqueue_scripts', 'my_theme_enqueue_styles' );
function my_theme_enqueue_styles() {
    $parenthandle = 'twenty-twenty-one-style'; // This is 'twenty-twenty-one-style' for the Twenty Twenty-one theme.
    $theme = wp_get_theme();
    wp_enqueue_style( $parenthandle, get_template_directory_uri() . '/style.css', 
        array(),  // if the parent theme code has a dependency, copy it to here
        $theme->parent()->get('Version')
    );
    wp_enqueue_style( 'child-style', get_stylesheet_uri(),
        array( $parenthandle ),
        $theme->get('Version') // this only works if you have Version in the style header
    );
}

// 取消图片被缩小至2560像素的限制

add_filter( 'big_image_size_threshold', '__return_false' );

// 分页增加显示 2

if ( ! function_exists( 'twenty_twenty_one_the_posts_navigation' ) ) {
	function twenty_twenty_one_the_posts_navigation() {
		the_posts_pagination(
			array(
				'mid_size' => 1,
			)
		);
	}
}

// 替换 Gravatar 头像资源为七牛云 CDN

function change_gravatar_url($avatar) {
    $avatar = str_replace(array("www.gravatar.com","cn.gravatar.com", "0.gravatar.com", "1.gravatar.com", "2.gravatar.com", "secure.gravatar.com"), "dn-qiniu-avatar.qbox.me", $avatar);
    return $avatar;
}
add_filter('get_avatar', 'change_gravatar_url');

// 替换 Emoji PNG 资源为 jsDeliver CDN

function change_wp_emoji_baseurl($url) {
	return set_url_scheme('//cdn.jsdelivr.net/gh/twitter/twemoji@latest/assets/72x72/');
}
add_filter('emoji_url', 'change_wp_emoji_baseurl');

function change_wp_emoji_svgurl($url) {
	return set_url_scheme('//cdn.jsdelivr.net/gh/twitter/twemoji@latest/assets/svg/');
}
add_filter('emoji_svg_url', 'change_wp_emoji_svgurl');

?>
