<?php
    $encoding = "utf-8";
    $mail_to = "m.zhorakhan@incom.kz";
    $from_name = "make";
    $from_mail = "m.zhorakhan@zeronetech.kz";

    $mail_subject = "Заголовок письма";

    // Preferences for Subject field
    $subject_preferences = array(
        "input-charset" => $encoding,
        "output-charset" => $encoding,
        "line-length" => 76,
        "line-break-chars" => "\r\n"
    );

    $mail_message = $_POST["email"];

    // Mail header
    $header = "Content-type: text/html; charset=".$encoding." \r\n";
    $header .= "From: ".$from_name." <".$from_mail."> \r\n";
    $header .= "MIME-Version: 1.0 \r\n";
    $header .= "Content-Transfer-Encoding: 8bit \r\n";
    $header .= "Date: ".date("r (T)")." \r\n";
    $header .= iconv_mime_encode("Subject", $mail_subject, $subject_preferences);

    // Send mail
    $result = mail($mail_to, $mail_subject, $mail_message, $header);

    if($result) {
        echo "Success";
      } else {
          echo "Error";
      }
?>