<?php

try {
    $request = Application::get()->getRequest();
    $email = (string)$_POST["email"];
    $news = new \Zerone\News();
    $follower = new \Zerone\Follower($email);
    $error = $news->attach($follower);
    if (!empty($error)) {
        $response = $error;
    } else {
        $response = array(
            "message" => "subscribed",
            "follower" => $follower->getEmail()
        );
    }
    echo json_encode($response);
} catch (Exception $exception) {
    dd($exception);
}