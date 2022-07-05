Minimal Child Theme funtions code

```
function my_theme_enqueue_styles() {
	wp_enqueue_style( 'twentynineteen-style', get_template_directory_uri() . '/style.css' );
	wp_enqueue_style( 'twentynineteen-child-style',
		get_stylesheet_directory_uri() . '/style.css',
		array( 'twentynineteen-style' )
	);

}
```
