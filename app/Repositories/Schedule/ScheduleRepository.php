<?php

namespace App\Repositories\User;

use App\Models\schedule;
use App\Repositories\BaseRepository\BaseRepository;

class ScheduleRepository extends BaseRepository implements ScheduleRepositoryInterface
{
    /**
     *@return void
     *
     */

    public function getModel()
    {
        return schedule::class;
    }

    
    public function store($data)
    {
        return $this->model->create($data);
    }

}
