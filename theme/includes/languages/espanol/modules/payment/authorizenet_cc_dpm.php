<?php

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_TITLE', 'Authorize.net Método de mensaje directo (DPM)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_PUBLIC_TITLE', 'Tarjeta de crédito');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&authorizenet&oscom23&dpm" target="_blank" style="text-decoration: underline; font-weight: bold;">View Online Documentation</a><br /><br /><img src="images/icon_popup.gif" border="0">&nbsp;<a href="http://reseller.authorize.net/application/?id=5559280" target="_blank" style="text-decoration: underline; font-weight: bold;">Visit Authorize.net Website</a>&nbsp;<a href="javascript:toggleDivBlock(\'anetInfo\');">(info)</a><span id="anetInfo" style="display: none;"><br /><i>Utilizando el enlace de arriba para registrarse en Authorize.net le garantiza en osCommerce una pequeña ventaja financiera por recomendar a un cliente.</i></span>');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_ADMIN_CONFIGURATION', 'Este módulo no se carga hasta que las APIs de ID de inicio de sesión y Parametrós de Transaction se hayan configurado. Por favor, modifique y establezca la configuración de este módulo.');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_OWNER_FIRSTNAME', 'Nombre del Propietario de la Tarjeta:');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_OWNER_LASTNAME', 'Apelidos del Propietario de la Tarjeta:');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_NUMBER', 'Número de la Tarjeta:');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_EXPIRES', 'Fecha de Caducidad de la Tarjeta:');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_CCV', 'Codigo de Verificación (CCV):');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_RETURN_BUTTON', 'Volver a ' . STORE_NAME);

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_A', 'La dirección (Calle) coincide, el Código Postal no');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_B', 'No ha indicado la información para la verificación de AVS');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_E', 'Error de AVS');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_G', 'El banco emisor de la tarjeta no es de los EE.UU.');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_N', 'No coincide la Dirección (Calle) o Código Postal');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_P', 'AVS no se aplica en esta transacción');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_R', 'Vuelva a intentarlo Sistema no disponibles o tiempo de espera agotado');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_S', 'Servicio no soportado por el emisor');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_U', 'La información de la dirección no está disponible');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_W', 'El Código Postal de nueve dígitos coincide, la Dirección (Calle) no');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_X', 'La Dirección (Calle) y el Código Postal de nueve dígitos coinciden');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_Y', 'La Dirección (Calle) y el Código Postal de cinco dígitos coinciden');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_Z', 'El Código Postal de cinco dígitos coincide, la Dirección (Calle) no');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_M', 'Coincide');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_N', 'No Coincide');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_P', 'No Procesado');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_S', 'Debería haber estado presente');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_U', 'El emisor no pudo procesar la solicitud');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_0', 'CAVV no se ha validado porque se han enviado datos erróneos');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_1', 'La validación de CAVV ha fallado');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_2', 'La validación de CAVV ha sido correcta');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_3', 'La validación de CAVV no pudo realizarse; respuesta del emisor incompleta');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_4', 'La validación de CAVV no pudo realizarse; error del sistema del emisor');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_5', 'Reservado para un futuro uso');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_6', 'Reservado para un futuro uso');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_7', 'Intento de validar el CAVV, Error en la validación, emisor disponible (tarjeta emitida en los EE.UU./adquirente no de los EE.UU.)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_8', 'Intento de validar el CAVV, Error en la validación, emisor disponible (tarjeta emitida en los EE.UU./adquirente no de los EE.UU.)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_9', 'Intento de validar el CAVV, Error en la validación, emisor no disponible (tarjeta emitida en los EE.UU./adquirente no de los EE.UU.)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_A', 'Intento de validar el CAVV, Validación correcta, emisor no disponible (tarjeta emitida en los EE.UU./adquirente no de los EE.UU.)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_B', 'CAVV ha pasado la validación, la información solamente, no hay cambio de obligaciones');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_TITLE', 'Se ha producido un error al procesar su tarjeta de crédito');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_VERIFICATION', 'La transacción con tarjeta de crédito no pudo ser verificada para este pedido. Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_DECLINED', 'Esta transacción con tarjeta de crédito ha sido rechazada. Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_GENERAL', 'Por favor, inténtelo de nuevo y si continúan los problemas, pruebe otro método de pago.');
?>
