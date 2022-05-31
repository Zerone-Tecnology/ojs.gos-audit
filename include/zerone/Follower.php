<?php

namespace Zerone;
use APP\facades\Repo;
use Illuminate\Mail\Mailer;
import('lib.pkp.classes.mail.Mail');
use PHPMailer\PHPMailer\Exception;

import('lib.pkp.classes.mail.MailTemplate');
class Follower extends Observer {
    private string $email;
    private string $title;
    private string $body;

    public function __construct($email)
    {
        $this->email = $email;
    }

    public function update()
    {
        import('mail.ArticleMailTemplate');
        import('submission.Submission');

        try {
            $article = new \Submission();
            $mail = new \ArticleMailTemplate($article, 'SUBMISSION_ACK');
            $mail->addRecipient($this->getEmail());
            $mail->assignParams(array(
                'authorName' => '$user->getFullName()',
                'authorUsername' => '$user->getUsername()',
                'editorialContactSignature' => '$journal->getSetting()',
                    "\n" . '$journal->getTitle()',
                'submissionUrl' => 'Request::getPageUrl()' .
                    '/author/submission/' . '$article->getArticleId()'
            ));
            $send = $mail->send();
            if (!$send) {
                dd($mail);
            }
        } catch (Exception $exception) {
            dd($exception);
        }


    }

    /**
     * @return string
     */
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    /**
     * @return string
     */
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * @param string $title
     */
    public function setTitle(string $title): void
    {
        $this->title = $title;
    }

    /**
     * @return string
     */
    public function getBody(): string
    {
        return $this->body;
    }

    /**
     * @param string $body
     */
    public function setBody(string $body): void
    {
        $this->body = $body;
    }




}