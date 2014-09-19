<?php

  define('MODULE_PAYMENT_STRIPE_TEXT_TITLE', 'Stripe');
  define('MODULE_PAYMENT_STRIPE_TEXT_PUBLIC_TITLE', 'Tarjeta de Crédito');
  define('MODULE_PAYMENT_STRIPE_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&stripe&oscom23&stripe_js" target="_blank" style="text-decoration: underline; font-weight: bold;">Ver la documentación en línea</a><br /><br /><img src="images/icon_popup.gif" border="0">&nbsp;<a href="https://www.stripe.com" target="_blank" style="text-decoration: underline; font-weight: bold;">Visitar la página web de Stripe</a>');

  define('MODULE_PAYMENT_STRIPE_ERROR_ADMIN_CURL', 'Este módulo necesita que cURL esté habilitado en PHP y no se cargará hasta que se haya habilitado en este servidor web.');
  define('MODULE_PAYMENT_STRIPE_ERROR_ADMIN_CONFIGURATION', 'Este módulo no se cargará hasta que se hayan configurado los parámetros de la clave publicable y la clave secreta. Por favor, editar y configurar los parámetros de este módulo.');

  define('MODULE_PAYMENT_STRIPE_CREDITCARD_NEW', 'Introduzca una nueva tarjeta');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_OWNER', 'Nombre en la tarjeta:');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_NUMBER', 'Número de tarjeta:');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_EXPIRY', 'Fecha de caducidad:');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_CVC', 'Código de seguridad:');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_SAVE', '¿Guardar la tarjeta para la próxima compra?');

  define('MODULE_PAYMENT_STRIPE_ERROR_TITLE', 'Se ha producido un error al procesar su tarjeta de crédito');
  define('MODULE_PAYMENT_STRIPE_ERROR_GENERAL', 'Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
  define('MODULE_PAYMENT_STRIPE_ERROR_CARDSTORED', 'La tarjeta guardada no se pudo encontrar. Por favor, inténtelo de nuevo y si continúan los problemas, por favor, pruebe con otro método de pago.');

  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_LINK_TITLE', 'Prueba de conexión al servidor de la API');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_TITLE', 'Prueba de conexión al servidor de la API');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_GENERAL_TEXT', 'Prueba de conexión al servidor..');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_BUTTON_CLOSE', 'Cerrar');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_TIME', 'Tiempo de conexión:');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_SUCCESS', '¡Correcto!');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_FAILED', '¡Error! Por favor, revise la configuración de los certificados SSL y vuelva a intentarlo.');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_ERROR', 'Ha ocurrido un error. Por favor, actualice la página, revise la configuración e inténtelo de nuevo.');
?>
