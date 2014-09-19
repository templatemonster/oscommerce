<?php

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_TITLE', 'Метод прямой рассылки  Authorize.net (DPM)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_PUBLIC_TITLE', 'Кредитные карты');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_DESCRIPTION', '<img src="images/icon_info.gif" border="0" />&nbsp;<a href="http://library.oscommerce.com/Package&en&authorizenet&oscom23&dpm" target="_blank" style="text-decoration: underline; font-weight: bold;">Просмотреть документацию онлайн</a><br /><br /><img src="images/icon_popup.gif" border="0">&nbsp;<a href="http://reseller.authorize.net/application/?id=5559280" target="_blank" style="text-decoration: underline; font-weight: bold;">Посетить сайт Authorize.net </a>&nbsp;<a href="javascript:toggleDivBlock(\'anetInfo\');">(информация)</a><span id="anetInfo" style="display: none;"><br /><i>Использование ссылки выше для регистрации на  Authorize.net подарит сообществу osCommerce небольшое денежное вознаграждение за привлечение клиента.</i></span>');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_ADMIN_CONFIGURATION', 'Данный модуль будет загружен только после настроек параметров  API Login ID и API Transaction Key. Пожалуйста, отредактируйте и настройте параметры модуля.');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_OWNER_FIRSTNAME', 'Имя владельца карты:');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_OWNER_LASTNAME', 'Фамилия владельца карты:');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_NUMBER', 'Номер карты:');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_EXPIRES', 'Срок использования карты:');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_CREDIT_CARD_CCV', 'Трёхзначный код проверки подлинности карты (CCV):');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_RETURN_BUTTON', 'Назад в ' . STORE_NAME);

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_A', 'Адрес (улица) совпадает, почтовый индекс нет');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_B', 'Адрес не предоставлен для проверки AVS');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_E', 'Ошибка AVS');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_G', 'Банк-эмитент за пределами США');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_N', 'Нет совпадения по адресу (улице) или почтовому индексу');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_P', 'AVS не может быть применен для этой транзакции');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_R', 'Повторить – Система недоступна или время доступа истекло');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_S', 'Сервис не поддерживается банком-эмитентом');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_U', 'Адресные данные не доступны');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_W', 'Девятизначный почтовый код совпадает, адрес (улица) нет');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_X', 'Адрес (улица) и девятизначный почтовый код совпадают');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_Y', 'Адрес (улица) и пятизначный почтовый код совпадают');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_AVS_Z', 'Пятизначный почтовый код совпадает, адрес (улица) нет');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_M', 'Совпадает');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_N', 'Не совпадает');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_P', 'Не выполнено');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_S', 'Должно быть в наличии');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CVV2_U', 'Банк-эмитент не может выполнить запрос');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_0', 'Авторизация не выполнена, потому что были введены неверные данные');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_1', 'Авторизация не выполнена');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_2', 'Авторизация выполнена');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_3', 'Авторизация не может быть выполнена; запрос банка-эмитента не полный');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_4', 'Авторизация не может быть выполнена; системная ошибка банка-эмитента');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_5', 'Сохранено для будущего использования');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_6', 'Сохранено для будущего использования');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_7', 'Попытка авторизации – проверка не выполнена – банк-эмитент доступен (карта выдана в США/ покупатель за пределами США)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_8', 'Попытка авторизации – проверка выполнена – банк-эмитент доступен (карта выдана в США/ покупатель за пределами США)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_9', 'Попытка авторизации – проверка не выполнена – банк-эмитент недоступен (карта выдана в США/ покупатель за пределами США)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_A', 'Попытка авторизации – проверка выполнена – банк-эмитент недоступен (карта выдана в США/ покупатель за пределами США)');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_TEXT_CAVV_B', 'Авторизация пройдена, только данные, ответственность не передается');

  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_TITLE', 'Во время обработки кредитной карты произошла ошибка');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_VERIFICATION', 'Транзакция кредитной карты не может быть выполнена с данным заказом. Пожалуйста, попробуйте снова и, если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_DECLINED', 'Данная транзакция кредитной карты была отклонена. Пожалуйста, попробуйте снова, и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
  define('MODULE_PAYMENT_AUTHORIZENET_CC_DPM_ERROR_GENERAL', 'Пожалуйста, попробуйте снова, и если проблема не будет устранена, воспользуйтесь другим способом оплаты.');
?>
