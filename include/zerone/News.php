<?php

namespace Zerone;
use Illuminate\Database\QueryException;

class News implements Subject {

    private array $observer = array();
    private string $name;
    private string $body;
    private FollowerDao $followerDao;

    public function __construct()
    {
        $this->followerDao = new FollowerDao();
    }

    /**
     * Attach the Observer to concrete subject
     * @param Follower $observer
     * @return void
     */
    function attach(Follower $observer)
    {
        $email = $observer->getEmail();
        try {
            $this->followerDao->setFollower($email);
        } catch (QueryException $exception) {
            return $exception;
        }
        $this->observer[] = $observer;
    }

    function detach(Follower $observer)
    {
        $email = $observer->getEmail();
        try {
            $this->followerDao->updateFollower($email);
        } catch (QueryException $exception) {
            return $exception;
        }
    }

    /**
     * Notify all followers
     * @return void
     */
    function notify()
    {
        $observers = $this->getObserver();
        /**
         * @var Observer $observer
         */
        foreach ($observers as $observer) {
            $observer->update();
        }
    }

    /**
     * Get all followers
     * @return \Illuminate\Support\Collection
     */
    public function getFollowers() {
        return $this->followerDao->getFollowers();
    }

    public function setFollower($email) {
        $this->followerDao->setFollower($email);
    }

    /**
     * @return array
     */
    public function getObserver(): array
    {
        return $this->observer;
    }

    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName(string $name): void
    {
        $this->name = $name;
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