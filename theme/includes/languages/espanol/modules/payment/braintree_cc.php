<?php

  define('MODULE_PAYMENT_BRAINTREE_CC_TEXT_TITLE', 'Soluciones de Pago de Braintree');
  define('MODULE_PAYMENT_BRAINTREE_CC_TEXT_PUBLIC_TITLE', 'Tarjeta de Credito');
  define('MODULE_PAYMENT_BRAINTREE_CC_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&braintree&oscom23&braintree_js" target="_blank" style="text-decoration: underline; font-weight: bold;">Ver la documentación en línea</a><br /><br /><img src="images/icon_popup.gif" border="0">&nbsp;<a href="https://www.braintreepayments.com" target="_blank" style="text-decoration: underline; font-weight: bold;">Visitar la página web de Braintree</a>');

  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_ADMIN_PHP', 'La versión mínima de PHP compatible con este módulo es %s, y no se cargará hasta que se haya instalado en el servidor web una versión más reciente.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_ADMIN_PHP_EXTENSIONS', 'Este módulo requiere las siguientes extensiones de PHP y no se cargará hasta que PHP haya sido actualizado :<br /><br />%s');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_ADMIN_MERCHANT_ACCOUNTS', 'Este módulo no se cargará hasta que una cuenta de comerciante ha sido definida para la moneda %s.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_ADMIN_CONFIGURATION', 'Este módulo no se cargará hasta que los siguientes parámetros hayan sido configurados: la identificación de comerciante, la clave pública, la clave privada, y la encriptación del lado del cliente. Por favor, editar y configurar este módulo.');

  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_NEW', 'Introduzca una nueva tarjeta');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_LAST_4', 'Últimos 4 dígitos:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_OWNER', 'Nombre en la tarjeta:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_NUMBER', 'Número de tarjeta:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_EXPIRY', 'Fecha de caducidad:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_CVV', 'Código de seguridad:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_SAVE', '¿Guardar la tarjeta para la próxima compra?');

  define('MODULE_PAYMENT_BRAINTREE_CC_CURRENCY_CHARGE', 'La moneda utilizada para mostrar los precios es %3$s. Se cargará en su tarjeta de crédito un total de <span style="white-space: nowrap;">%1$s %2$s</span> para este pedido.');

  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_TITLE', 'Se ha producido un error al procesar su tarjeta de crédito');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_GENERAL', 'Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_CARDOWNER', 'El nombre del propietario de la tarjeta debe ser proporcionada para completar el pedido. Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_CARDNUMBER', 'El número de tarjeta no pudo ser procesado. Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_CARDEXPIRES', 'La fecha de caducidad de la tarjeta no pudo ser procesada. Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_CARDCVV', 'El código de seguridad de la tarjeta no pudo ser procesado. Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
?>
