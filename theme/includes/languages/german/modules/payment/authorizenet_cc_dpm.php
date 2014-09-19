<?php

define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_TITLE', 'Direkt-Mailing  Authorize.net (DPM)');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_PUBLIC_TITLE', 'Kreditkarten');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&authorizenet&oscom23&dpm" target="_blank" style="text-decoration: underline; font-weight: bold;">Dokumentation Online anschauen</a><br /><br /><img src="images/icon_popup.gif" border="0">&nbsp;<a href="http://reseller.authorize.net/application/?id=5559280" target="_blank" style="text-decoration: underline; font-weight: bold;">Website Authorize.net besuchen </a>&nbsp;<a href="javascript:toggleDivBlock(\'anetInfo\');">(Information)</a><span id="anetInfo" style="display: none;"><br /><i>Indem man den Link zur Registrierung auf Authorize.net oben nutzt, erhält osCommerce Gemeinschaft kleine Geldprämie für Kundengewinnung.</i></span>');

define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_ADMIN_CONFIGURATION', 'Das jeweilige Modul wird hochgeladen, nachdem Parameter  API Login ID und API Transaction Key eingestellt wurden. Bearbeiten Sie und stellen Sie, bitte, Modulparameter ein.');

define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_OWNER_FIRSTNAME', 'Vorname des Karteninhabers:');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_OWNER_LASTNAME', 'Name des Karteninhabers:');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_NUMBER', 'Kartennummer:');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_EXPIRES', 'Kartennutzungsdauer:');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_CCV', 'Dreistelliger Schlüssel der Kartenauthentifizierung (CCV):');

define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_RETURN_BUTTON', 'Zurück zu ' . STORE_NAME);

define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_A', 'Adresse (Straße) passt, aber Postleitzahl nicht');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_B', 'Die Adresse wurde zum Testen AVS zur Verfügung nicht gestellt');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_E', 'Fehler AVS');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_G', 'Ausstellende Bank ist außerhalb der USA');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_N', 'Keine Übereinstimmung nach der Adresse (Straße) oder Postleitzahl');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_P', 'AVS kann nicht auf diese Transaktion verwendet werden');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_R', 'Wiederholen – Das System ist nicht verfügbar oder Zugriffszeit ist abgelaufen');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_S', 'Service wird von der ausstellenden Bank nicht unterstützt');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_U', 'Adreßdaten sind nicht verfügbar');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_W', 'Neunstellige Postleitzahl passt, aber Adresse (Straße) nicht');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_X', 'Adresse (Straße) und neunstellige Postleitzahl passen');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_Y', 'Adresse (Straße) und fünfstellige Postleitzahl passen');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_Z', 'Fünfstellige Postleitzahl passt, aber Adresse (Straße) nicht');

define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_M', 'Passt');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_N', 'Nicht passt');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_P', 'Wurde nicht durchgeführt');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_S', 'Muss auf Lage sein');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_U', 'Ausstellende Bank kann die Abfrage nich ausführen');

define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_0', 'Autorisierung wird nicht durchgeführt, weil falsche Daten eingegeben wurden');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_1', 'Autorisierung wurde nicht durchgeführt');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_2', 'Autorisierung wurde durchgeführt');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_3', 'Autorisierung kann nicht durchgeführt werden; Abfrage der ausstellenden Bank ist nicht voll');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_4', 'Autorisierung kann nicht durchgeführt werden; Systemfehler der ausstellenden Bank');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_5', 'Es wurde für zukünftige Verwendung gespeichert');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_6', 'Es wurde für zukünftige Verwendung gespeichert');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_7', 'Autorisierungsversuch – Prüfung wurde nicht durchgeführt – ausstellende Bank ist verfügbar (Karte wurde in den USA ausgestellt/ Käufer ist außerhalb der USA)');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_8', 'Autorisierungsversuch – Prüfung wurde durchgeführt – ausstellende Bank ist verfügbar (Karte wurde in den USA ausgestellt/ Käufer ist außerhalb der USA)');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_9', 'Autorisierungsversuch – Prüfung wurde nicht durchgeführt – ausstellende Bank ist nicht verfügbar (Karte wurde in den USA ausgestellt/ Käufer ist außerhalb der USA)');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_A', 'Autorisierungsversuch – Prüfung wurde durchgeführt – ausstellende Bank ist nicht verfügbar (Karte wurde in den USA ausgestellt/ Käufer ist außerhalb der USA)');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_B', 'Autorisierung wurde durchgeführt, aber Daten sind ohne Haftungsumkehr (no liabitli shift)');

define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_TITLE', 'Während der Kreditkartenverarbeitung ist ein Fehler aufgetreten');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_VERIFICATION', 'Kreditkartentransaktion mit der jeweiligen Bestellung kann nicht durchgeführt werden. Versuchen Sie, bitte, noch einmal, und wenn dieser Fehler wieder auftritt, nutzen Sie dann andere Zahlungsart.');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_DECLINED', 'Diese Kreditkartentransaktion wurde abgelehnt. Versuchen Sie, bitte, noch einmal, und wenn dieser Fehler wieder auftritt, nutzen Sie dann andere Zahlungsart.');
define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_GENERAL', 'Versuchen Sie, bitte, noch einmal, und wenn dieser Fehler wieder auftritt, nutzen Sie dann andere Zahlungsart.');

?>
