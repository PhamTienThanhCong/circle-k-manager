<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateSchedule;
use App\Models\Department;
use App\Models\schedule;
use Illuminate\Http\Request;
use Redirect;
use App\Repositories\User\UserRepositoryInterface;
// use App\Repositories\Schedule\ScheduleRepositoryInterface;
use Illuminate\Support\Facades\Auth;

class ScheduleController extends Controller
{
    private $schedule;
    private $user;

    public function __construct(UserRepositoryInterface $user)
    {
        // $this->schedule = $schedule;
        $this->user = $user;
    }

    public function index(){
        $validated['department_id'] = Auth::user()->department_id;
        $validated['role_id'] = config('const.ROLE.USER');
        $allUser = $this->user->getAll($validated);

        $data = schedule::query()
                ->select('users.fullname', 'schedules.*')
                ->join('users', 'schedules.user_id', '=', 'users.id')
                ->where('schedules.department_id', '=', $validated["department_id"])
                ->get();
        
        return view('schedule.index', compact('allUser', 'data'));
    }

    public function store(CreateSchedule $request){
        $data = $request->only('day_of_week', 'shift', 'user_id');
        $data['department_id'] = Auth::user()->department_id;
        schedule::query()
                ->where('day_of_week', '=', $data['day_of_week'])
                ->where('department_id', '=', $data['department_id'])
                ->where('shift', '=', $data['shift'])
                ->delete();
        schedule::create($data);
        return redirect()->route('schedule')->with('success', __('message.msgAdd'));
        // $result = $this->schedule->store($data);
        // if ($result) {
        // }
        // return redirect()->route('schedule')->with('error', __('message.msgAddFail'));
    }
}
