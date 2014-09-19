<?php

  define('MODULE_PAYMENT_STRIPE_TEXT_TITLE', 'Stripe');
  define('MODULE_PAYMENT_STRIPE_TEXT_PUBLIC_TITLE', 'Кредитная карта');
  define('MODULE_PAYMENT_STRIPE_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&stripe&oscom23&stripe_js" target="_blank" style="text-decoration: underline; font-weight: bold;">Просмотреть документацию онлайн</a><br /><br /><img src="images/icon_popup.gif" border="0">&nbsp;<a href="https://www.stripe.com" target="_blank" style="text-decoration: underline; font-weight: bold;">Посетить веб-сайт Stripe </a>');

  define('MODULE_PAYMENT_STRIPE_ERROR_ADMIN_CURL', 'Данный модуль будет загружен только после активации PHP расширения cURL на сервере.');
  define('MODULE_PAYMENT_STRIPE_ERROR_ADMIN_CONFIGURATION', 'Данный модуль будет загружен только после настройки параметров открытого ключа ( Publishable Key) и закрытого ключа (Secret Key). Пожалуйста, отредактируйте и настройте параметры модуля.');

  define('MODULE_PAYMENT_STRIPE_CREDITCARD_NEW', 'Введите новую карту');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_OWNER', 'Имя владельца карты');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_NUMBER', 'Номер карты:');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_EXPIRY', 'Срок действия:');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_CVC', 'Защитный код:');
  define('MODULE_PAYMENT_STRIPE_CREDITCARD_SAVE', 'Запомнить карту для следующей покупки?:');

  define('MODULE_PAYMENT_STRIPE_ERROR_TITLE', 'Во время обработки кредитной карты произошла ошибка');
  define('MODULE_PAYMENT_STRIPE_ERROR_GENERAL', 'Пожалуйста, попробуйте снова, и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
  define('MODULE_PAYMENT_STRIPE_ERROR_CARDSTORED', 'Используемая карта не может быть найдена. Пожалуйста, попробуйте снова, и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');

  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_LINK_TITLE', 'Проверить подключение к  API серверу');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_TITLE', 'Проверка подключения к API серверу');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_GENERAL_TEXT', 'Проверка подключения к серверу..');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_BUTTON_CLOSE', 'Закрыть');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_TIME', 'Время подключения:');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_SUCCESS', 'Успех!');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_FAILED', 'Не выполнено! Пожалуйста, проверьте настройки SSL сертификата и попробуйте снова.');
  define('MODULE_PAYMENT_STRIPE_DIALOG_CONNECTION_ERROR', 'Произошла ошибка. Пожалуйста, обновите страницу, проверьте настройки и попробуйте снова.');

?>
