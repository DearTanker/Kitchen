<?php
/**
 * The template for displaying the footer
 *
 * Contains footer content and the closing of the #main and #page div elements.
 *
 * @package WordPress
 * @subpackage SimPo
 * @since SimPo 1.0
 */
?>
	</div><!-- #main .wrapper -->
	<footer id="colophon" role="contentinfo">
		<div class="back-to-top"><a><?php esc_attr_e( 'Back to Top', 'simpo' ); ?></a></div>
		<script src="<?php echo get_template_directory_uri(); ?>/js/backtotop.js" type="text/javascript"></script>
		<div class="site-info">
			<?php do_action( 'simpo_credits' ); ?>
			<div class="copyright">
			<p style="float:right;"><a href="http://www.huging.com" target="_blank" title="虎鲸网 - 有时候 · 购物不光是需求 · 更多是一种心情">虎鲸网 - 有时候 · 购物不光是需求 · 更多是一种心情 &gt;&gt;</a></p>
			<p>Host by <a href="http://www.vultr.com/?ref=6928187-3B" target="_blank">Vultr</a>
			<p>Theme <a href="http://blog.deartanker.com/?p=1787">SimPo</a> by <a href="http://blog.deartanker.com/">DearTanker</a></p>
			<p>Sitemap <a href="<?php echo esc_url( home_url( '/' ) ); ?>sitemap.xml">;-)</a></p>
			<a href="<?php echo esc_url( __( 'https://wordpress.org/', 'simpo' ) ); ?>" title="<?php esc_attr_e( 'Semantic Personal Publishing Platform', 'simpo' ); ?>"><?php printf( __( 'Proudly powered by %s', 'simpo' ), 'WordPress' ); ?></a>
		</div><!-- .site-info -->
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>
</body>
</html>