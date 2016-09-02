/bin/bash -eux

if [ ! -e ./wp-content/mu-plugins/mail.php ]; then
	mkdir ./wp-content/mu-plugins
	cat > ./wp-content/mu-plugins/mail.php <<-EOF
		<?php
		
		/**
		* Plugin Name: Configure SMTP
		* Description: Awesome way to configure SMTP
		* Author: Pierre Ozoux * Version: 0.1
		*/
		
		add_filter( 'wp_mail_from', function( $email ) {
			return "${MAIL_USER}";
		});
		
		add_action( 'phpmailer_init', 'send_smtp_email' );
		function send_smtp_email( \$phpmailer ) {
			\$phpmailer->isSMTP();
			\$phpmailer->SMTPAuth = true;
			\$phpmailer->Host = "${MAIL_HOST}";
			\$phpmailer->Port = "${MAIL_PORT}";
			\$phpmailer->Username = "${MAIL_USER}";
			\$phpmailer->Password = "${MAIL_PASS}";
			// Encryption system to use - ssl or tls
			\$phpmailer->SMTPSecure = "${MAIL_SECURITY}";
			\$phpmailer->From = "${MAIL_USER}";
			\$phpmailer->FromName = "WordPress Admin";
		}
		?>
	EOF
fi

/entrypoint.sh php-fpm
