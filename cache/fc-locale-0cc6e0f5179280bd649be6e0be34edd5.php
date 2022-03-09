<?php return array (
  'emails.orcidCollectAuthorId.subject' => 'ORCID подання',
  'emails.orcidCollectAuthorId.body' => 'Шановний|Шановна {$authorName},
<br/>
Ви були зазначені як автор рукопису, надісланого в {$contextName}. <br/>
Щоб підтвердити своє авторство, додайте свій ідентифікатор ORCID до цього подання, відвідавши посилання, вказане нижче.<br/>
<br/>
<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width=\'16\' height=\'16\' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Зареєструватися або увійти з ORCID iD</a><br/>
<br/>
<br>
<a href="{$orcidAboutUrl}">Більше інформації про ORCID тут {$contextName}</a><br/>
<br/>
Якщо ви маєте запитання, напишіть мені.<br/>
<br/>
{$principalContactSignature}<br/>
',
  'emails.orcidCollectAuthorId.description' => 'Цей шаблон електронного листа використовується для збору ідентифікаторів ORCID з співавторів.',
  'emails.orcidRequestAuthorAuthorization.body' => 'Шановний|Шановна {$authorName},<br>
<br>
Ви були зазначені як автор подання "{$submissionTitle}" до журналу {$contextName}.
<br>
<br>
Будь-ласка, дозвольте нам додати ваш ORCID до цього подання а також додати подання до вашого профілю ORCID  після публікації.<br>
Відвідайте офіційний сайт ORCID, авторизуйтеся з вашим профілем і надайте дозвіл за наступною інструкцією.<br>
<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width=\'16\' height=\'16\' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Зареєструватися або авторизуватися з ORCID iD</a><br/>
<br>
<br>
<a href="{$orcidAboutUrl}">Більше про ORCID за посиланням {$contextName}</a><br/>
<br>
Якщо у вас виникнуть запитання, напишіть мені.<br>
<br>
{$principalContactSignature}<br>
',
  'emails.orcidRequestAuthorAuthorization.description' => 'Цей шаблон листа використовується для запита доступу у авторів до запису ORCID.',
  'emails.orcidRequestAuthorAuthorization.subject' => 'Запит доступу до запису ORCID',
);