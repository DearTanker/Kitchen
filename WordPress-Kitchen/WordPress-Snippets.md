Child Theme funtions code

```
add_action( 'wp_enqueue_scripts', 'child_theme_enqueue_styles' );
function child_theme_enqueue_styles() {
    $parenthandle = 'parent-style'; // parent-style must change with parent theme folder name with '-style'
    $childhandle = 'child-style';
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
```
