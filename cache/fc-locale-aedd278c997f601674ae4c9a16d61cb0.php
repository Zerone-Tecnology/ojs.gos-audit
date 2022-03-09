<?php return array (
  'emails.manualPaymentNotification.subject' => 'Інформування про платіж',
  'emails.manualPaymentNotification.body' => 'На рахунок журналу {$contextName} користувачем {$userFullName} (username &quot;{$userName}&quot;) повинен бути перерахований платіж.<br />
<br />
Це плата за &quot;{$itemName}&quot;.<br />
Сума платежу {$itemCost} ({$itemCurrencyCode}).<br />
<br />
Цей лист був створений модулем ручних платежів системи Open Journal Systems.',
  'emails.manualPaymentNotification.description' => 'Цей шаблон листа використовується для інформування менеджера журнала про запит на здійснення ручного платежу.',
);