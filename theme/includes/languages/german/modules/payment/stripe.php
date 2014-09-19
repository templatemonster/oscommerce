<?php

define('MODULE_PAYMENT_STRIPE_TEXT_TITLE', 'Stripe');
define('MODULE_PAYMENT_STRIPE_TEXT_PUBLIC_TITLE', 'Kreditkarte');
define('MODULE_PAYMENT_STRIPE_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&stripe&oscom23&stripe_js" target="_blank" style="text-decoration: underline; font-weight: bold;">Dokumentation Online anschauen</a><br /><br /><img src="images/icon_popup.gif" border="0">&nbsp;<a href="https://www.stripe.com" target="_blank" style="text-decoration: underline; font-weight: bold;">Website Stripe besuchen </a>');

define('MODULE_PAYMENT_STRIPE_ERROR_ADMIN_CURL', 'Dieses Modul wird nur nach der Aktivierung der PHP Erweiterung cURL auf dem Sever hochgeladen.');
define('MODULE_PAYMENT_STRIPE_ERROR_ADMIN_CONFIGURATION', 'Dieses Modul wird nach der Einstellung der Parameter des öffentlichen Schlüssels ( Publishable Key) und privaten Schlüssels (Secret Key) hochgeladen. Bearbeiten Sie und stellen Sie, bitte, Modulparameter ein.');

define('MODULE_PAYMENT_STRIPE_CREDITCARD_NEW', 'Geben Sie die neue Karte ein');
define('MODULE_PAYMENT_STRIPE_CREDITCARD_OWNER', 'Name des Karteninhabers');
define('MODULE_PAYMENT_STRIPE_CREDITCARD_NUMBER', 'Kartennummer:');
define('MODULE_PAYMENT_STRIPE_CREDITCARD_EXPIRY', 'Gültigkeit:');
define('MODULE_PAYMENT_STRIPE_CREDITCARD_CVC', 'Sicherheitscode:');
define('MODULE_PAYMENT_STRIPE_CREDITCARD_SAVE', 'Muss die Karte für den nächsten Kauf gespeichert werden?:');

define('MODULE_PAYMENT_STRIPE_ERROR_TITLE', 'Während der Kartenbearbeitung ist ein Fehler aufgetreten');
define('MODULE_PAYMENT_STRIPE_ERROR_GENERAL', 'Versuchen Sie, bitte, noch einmal, und wenn dieser Fehler wieder auftritt, nutzen Sie dann andere Zahlungsart.');
define('MODULE_PAYMENT_STRIPE_ERROR_CARDSTORED', 'Verwendete Karte kann nicht gefunden werden. Versuchen Sie, bitte, noch einmal, und wenn dieser Fehler wieder auftritt, nutzen Sie dann andere Zahlungsart.');

define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_LINK_TITLE', 'ПVerbindung zum  API Server prüfen');
define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_TITLE', 'Prüfung der Verbindung zum  API Server');
define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_GENERAL_TEXT', 'Prüfung der Verbindung zum Server..');
define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_BUTTON_CLOSE', 'Schließen');
define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_TIME', 'Verbindungszeit:');
define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_SUCCESS', 'Erfolg!');
define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_FAILED', 'Wurde nicht durchgeführt! Prüfen Sie, bitte, Einstellungen des SSL-Zertifikats und versuchen Sie noch einmal.');
define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_ERROR', 'Ein Fehler ist aufgetreten. Aktualisieren Sie, bitte, die Seite, prüfen Sie die Einstellungen und versuchen Sie noch einmal.');
?>
