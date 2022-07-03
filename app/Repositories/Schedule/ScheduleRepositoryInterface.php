<?php

namespace App\Repositories\User;

use App\Repositories\BaseRepository\BaseRepositoryInterface;

interface ScheduleRepositoryInterface extends BaseRepositoryInterface
{
    public function store($data);
}
