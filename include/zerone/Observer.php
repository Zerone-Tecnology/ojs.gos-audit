<?php

namespace Zerone;
abstract class Observer {
    /**
     * Notify the follower
     * @return mixed
     */
    public abstract function update();
}