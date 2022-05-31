<?php

namespace Zerone;
interface Subject {
    function attach(Follower $observer);
    function detach(Follower $observer);
    function notify();
}