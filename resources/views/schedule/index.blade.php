@extends('layouts.main')
@section('title')
    Trang chủ
@endsection
@section('content')
    {{-- @dd($allDepartments) --}}
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h1 style="text-align:center">Danh sách xếp lịch</h1>
                        </div>
                        @if (session('error'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>Thông báo: </strong>{{ session('error') }}.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif
                        @if (session('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <strong>Thông báo: </strong>{{ session('success') }}.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif
                        @error('id')
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>Thông báo: </strong>{{ $message }}.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @enderror
                        @error('name')
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>Thông báo: </strong>{{ $message }}.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @enderror
                        @error('description')
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>Thông báo: </strong>{{ $message }}.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @enderror
                        @error('user_id')
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>Thông báo: </strong>{{ $message }}.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @enderror
                        @if (Auth::user()->role_id == config('const.ROLE.MANAGE'))
                            <div class="card-body">
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-success addButton" data-bs-toggle="modal"
                                        data-bs-target="#formModal"><i class="fas fa-user-plus"></i>Thêm ca làm việc</button>
                                </div>
                            </div>
                        @endif
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Thứ</th>
                                        <th>Ca 1(06:00 - 14:00)</th>
                                        <th>Ca 2(14:00 - 22:00)</th>
                                        <th>Ca 3(22:00 - 06:00)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @for ($i = 2 ; $i <= 8 ; $i++)
                                        <tr>
                                            <td>
                                                @if ($i != 8)
                                                    Thứ {{ $i }}
                                                @else
                                                    Chủ nhật
                                                @endif
                                            </td>
                                            <td>
                                                <?php $count = 0 ?>
                                                @foreach ($data as $employee)
                                                    @if($employee->day_of_week == $i && $employee->shift == 1)
                                                        <?php $count++ ?>
                                                        {{ $employee->fullname }}
                                                        @break      
                                                    @endif
                                                @endforeach
                                                @if ($count == 0)
                                                    <span style="color:red">
                                                        Ca này trống nhân viên
                                                    </span>
                                                @endif
                                            </td>
                                            <td>
                                                <?php $count = 0 ?>
                                                @foreach ($data as $employee)
                                                    @if($employee->day_of_week == $i && $employee->shift == 2)
                                                        <?php $count++ ?>
                                                        {{ $employee->fullname }}
                                                        @break
                                                    @endif
                                                @endforeach
                                                @if ($count == 0)
                                                    <span style="color:red">
                                                        Ca này trống nhân viên
                                                    </span>
                                                @endif
                                            </td>
                                            <td>
                                                <?php $count = 0 ?>
                                                @foreach ($data as $employee)
                                                    @if($employee->day_of_week == $i && $employee->shift == 3)
                                                        <?php $count++ ?>
                                                        {{ $employee->fullname }}
                                                        @break
                                                    @endif
                                                @endforeach
                                                @if ($count == 0)
                                                    <span style="color:red">
                                                        Ca này trống nhân viên
                                                    </span>
                                                @endif
                                            </td>
                                        </tr>
                                    @endfor
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    </div>
    @include('schedule.add_schedule')
@endsection
