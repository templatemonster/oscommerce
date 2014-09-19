<?php

  define('MODULE_PAYMENT_PAYPAL_PRO_HS_TEXT_TITLE', 'PayPal Payments Pro (Solución Hospedada)');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_TEXT_PUBLIC_TITLE', 'PayPal (incluyendo Tarjetas de Crédito y Débito)');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&paypal&oscom23&payments_pro_hosted" target="_blank" style="text-decoration: underline; font-weight: bold;">Ver la documentación en línea</a><br /><br /><img src="images/icon_popup.gif" border="0" />&nbsp;<a href="https://www.paypal.com" target="_blank" style="text-decoration: underline; font-weight: bold;">Visitar la página web de PayPal</a>');

  define('MODULE_PAYMENT_PAYPAL_PRO_HS_ERROR_ADMIN_CURL', 'Este módulo necesita que cURL esté habilitado en PHP y no se cargará hasta que se haya habilitado en este servidor web.');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_ERROR_ADMIN_CONFIGURATION', 'Este módulo no se cargará hasta que se hayan configurado los parámetros de dirección de correo electrónico del vendedor y las credenciales de la API. Por favor, editar y configurar los parámetros de este módulo.');

  define('MODULE_PAYMENT_PAYPAL_PRO_HS_TEXT_PAYPAL_RETURN_BUTTON', 'Volver a ' . STORE_NAME); // Maximum length 60 characters, otherwise it is ignored.
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_TEXT_INVALID_TRANSACTION', 'No se pudo verificar la transacción de PayPal. Por favor, inténtelo de nuevo.');

  define('MODULE_PAYMENT_PAYPAL_PRO_HS_ERROR_TITLE', 'Se ha producido un error al procesar su pedido');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_ERROR_GENERAL', 'Por favor, inténtelo de nuevo y si continúan los problemas, por favor, pruebe con otro método de pago.');

  define('MODULE_PAYMENT_PAYPAL_PRO_HS_DIALOG_CONNECTION_LINK_TITLE', 'Prueba de conexión al servidor de la API');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_DIALOG_CONNECTION_TITLE', 'Prueba de conexión al servidor de la API');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_DIALOG_CONNECTION_GENERAL_TEXT', 'Prueba de conexión al servidor..');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_DIALOG_CONNECTION_BUTTON_CLOSE', 'Cerrar');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_DIALOG_CONNECTION_TIME', 'Tiempo de conexión:');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_DIALOG_CONNECTION_SUCCESS', '¡Correcto!');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_DIALOG_CONNECTION_FAILED', '¡Error! Por favor, revise la configuración de los certificados SSL y vuelva a intentarlo.');
  define('MODULE_PAYMENT_PAYPAL_PRO_HS_DIALOG_CONNECTION_ERROR', 'Ha ocurrido un error. Por favor, actualice la página, revise la configuración e inténtelo de nuevo.');
?>
