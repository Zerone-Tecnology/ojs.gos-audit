<?php return array (
  'emails.paypalInvestigatePayment.subject' => 'Незвичайна активність PayPal',
  'emails.paypalInvestigatePayment.body' => 'Система Open Journal Systems помітила незвичайну активність у функціонуванні модуля платежів PayPal журналу {$contextName}. Може знадобитись подальше вивчення цього питання або ручне втручання.<br />
                       <br />
Цей лист створений модулем PayPal системи Open Journal Systems.<br />
<br />
Повна інформація про запит:<br />
{$postInfo}<br />
<br />
Додаткова інформація (якщо наявна):<br />
{$additionalInfo}<br />
<br />
Дані сервера:<br />
{$serverVars}<br />
',
  'emails.paypalInvestigatePayment.description' => 'Цей шаблон листа використовується для інформування основної контактної особи журналу про виявлення модулем PayPal підозрілої активності або активності, що потребує ручного втручання.',
);