<?php

namespace Zerone;
use Illuminate\Database\Capsule\Manager as DB;
use Illuminate\Support\Facades\Date;
class FollowerDao
{
    const DB_TABLE_NAME = "zerone_subscribes";
    public function __construct()
    {

    }

    /**
     * Get the all followers from db
     * @return \Illuminate\Support\Collection
     */
    public function getFollowers() {
        return DB::table(self::DB_TABLE_NAME)->get();
    }

    /**
     * Insert to the db
     * @param $email
     * @return void
     */
    public function setFollower($email) {
        $active = 1;
        $date = Date::today();
        DB::insert('INSERT INTO zerone_subscribes (email,date_subscribe,active) VALUES (?,?,?)',[$email,$date,$active]);
    }

    public function updateFollower($email) {
        $follower = DB::table(self::DB_TABLE_NAME)->where('email','=',$email)->get();
        $active = $follower->get('active') == !1 ? 0 : 1;
        DB::table(self::DB_TABLE_NAME)->where('email','=',$email)->update([
            'active' => $active
        ]);
    }
}