<div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ route('schedule.create') }}" id="addForm" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><label id="lableTitle">Xếp ca làm việc</label></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="alert alert-danger alert-dismissible fade show" id="errorUser" role="alert"
                            style="display:none">
                            <strong>{{ __('message.errorUser') }}</strong>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-outline">
                                    <label class="form-label">Thứ làm việc</label>
                                    <select id="sort-select" class="form-select form-select" name="day_of_week">
                                        <option selected disabled>Chọn Thứ</option>
                                            @for ($i = 2; $i <= 8 ; $i++)
                                                <option value="{{ $i }}">
                                                    @if ($i != 8)
                                                        Thứ {{ $i }}
                                                    @else
                                                        Chủ nhật
                                                    @endif
                                                </option>
                                            @endfor
                                    </select>
                                </div>

                            </div>

                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <div class="form-outline">
                                    <label class="form-label">Ca làm việc</label>
                                    <select id="sort-select" class="form-select form-select" name="shift">
                                        <option selected disabled>Chọn ca làm việc</option>
                                        <option value="1">Ca 1(06:00 - 14:00)</option>
                                        <option value="2">Ca 2(14:00 - 22:00)</option>
                                        <option value="3">Ca 3(22:00 - 06:00)</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <div class="form-outline">
                                    <label class="form-label">Nhân viên</label>
                                    <select id="sort-select" class="form-select form-select" name="user_id">
                                        <option selected disabled>Chọn nhân viên</option>
                                        @foreach ($allUser as $user)
                                            <option value="{{ $user->id }}">
                                                {{ $user->fullname }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary saveButton">Thêm ca làm việc</button>
                </div>
            </form>
        </div>
    </div>
</div>
