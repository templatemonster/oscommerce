<?php

  define('MODULE_PAYMENT_BRAINTREE_CC_TEXT_TITLE', 'Модуль оплаты Braintree');
  define('MODULE_PAYMENT_BRAINTREE_CC_TEXT_PUBLIC_TITLE', 'Кредитная карта');
  define('MODULE_PAYMENT_BRAINTREE_CC_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&braintree&oscom23&braintree_js" target="_blank" style="text-decoration: underline; font-weight: bold;">Просмотреть документацию онлайн</a><br /><br /><img src="images/icon_popup.gif" border="0">&nbsp;<a href="https://www.braintreepayments.com" target="_blank" style="text-decoration: underline; font-weight: bold;">Посетить веб-сайт Braintree Payments </a>');

  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_ADMIN_PHP', 'Для функционирования модуля требуется PHP минимальной версии %s и он будет загружен только после установки новой версии на сервере.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_ADMIN_PHP_EXTENSIONS', 'Для функционирования модуля необходимы следующие  PHP  расширения и он будет загружен только после обновления PHP:<br /><br />%s');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_ADMIN_MERCHANT_ACCOUNTS', 'Данный модуль будет загружен только после настройки платежной учетной записи для  %s валюты.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_ADMIN_CONFIGURATION', 'Данный модуль будет загружен только после настройки параметров платежного агента (Merchant ID), открытого ключа (Public Key), закрытого ключа (Private Key), и клиентского шифровального ключа (Client Side Encryption Key). Пожалуйста, отредактируйте и настройте параметры модуля.');

  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_NEW', 'Введите новую карту');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_LAST_4', 'Последние 4 цифры:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_OWNER', 'Имя владельца карты:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_NUMBER', 'Номер карты:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_EXPIRY', 'Срок действия:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_CVV', 'Защитный код:');
  define('MODULE_PAYMENT_BRAINTREE_CC_CREDITCARD_SAVE', 'Запомнить карту для следующей покупки?:');

  define('MODULE_PAYMENT_BRAINTREE_CC_CURRENCY_CHARGE', 'Текущая валюта для отображения цен - %3$s. Для  данного заказа с кредитной карты будет списана сумма в размере <span style="white-space: nowrap;">%1$s %2$s</span>.');

  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_TITLE', 'Во время обработки кредитной карты произошла ошибка');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_GENERAL', 'Пожалуйста, попробуйте снова и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_CARDOWNER', 'Для завершения заказа необходимо предоставить имя владельца карты. Пожалуйста, попробуйте снова,  и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_CARDNUMBER', 'Номер карты не был обработан. Пожалуйста, попробуйте снова, и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_CARDEXPIRES', 'Срок действия карты не был обработан. Пожалуйста, попробуйте снова, и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
  define('MODULE_PAYMENT_BRAINTREE_CC_ERROR_CARDCVV', 'Защитный код карты не был обработан. Пожалуйста, попробуйте снова, и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
?>
