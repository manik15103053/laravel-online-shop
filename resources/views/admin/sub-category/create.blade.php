@extends('admin.layouts.master')

@section('sub-category', Request::is('admin/sub-categories*') ? 'active' : '')
@section('title')
Sub Category Create
@endsection
@push('css')
    <style>

    </style>
@endpush
@section('main-content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid my-2">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Create Sub Category</h1>
                </div>
                <div class="col-sm-6 text-right">
                    <a href="{{ route('admin.sub-category.index') }}" class="btn btn-primary">Back</a>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="container-fluid">
            <form action="" method="post" id="subCategoryForm" name="subCategoryForm">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="name">Category</label>
                                    <select name="category" id="category" class="form-control">
                                        @if ($categories->count() > 0)
                                            <option value="">Select Category</option>
                                            @foreach ($categories as $item)
                                                <option value="{{ $item->id }}" {{ old('category') == $item->id ? 'selected' : '' }}>{{ $item->name }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="name">Sub Category</label>
                                    <input type="text" name="name" id="name" class="form-control" placeholder="Sub Category Name">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="email">Slug</label>
                                    <input type="text" readonly name="slug" id="slug" class="form-control" placeholder="Slug">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email">Status</label>
                                    <select name="status" class="form-control" id="status">
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email">Show On Home</label>
                                    <select name="show_home" class="form-control" id="status">
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pb-5 pt-3">
                    <button type="submit" class="btn btn-primary">Create</button>
                    <button type="reset" class="btn btn-danger">Cancel</button>
                </div>
            </form>
        </div>
        <!-- /.card -->
    </section>
    <!-- /.content -->
</div>

@endsection

@push('js')
<script>
    //Get Sub Category Slug
    $("#name").on('input', function(){

        var element = $(this);
        $("button[type=submit]").prop('disabled', true);
        $.ajax({
            method: "get",
            url: "{{ route('admin.sub-category.getSubCategorySlug') }}",
            data: { title : element.val() },
            dataType: "json",
            success: function (response) {
                $("button[type=submit]").prop('disabled', false);
                if(response.status){
                    $("#slug").val(response.slug);
                }
            }
        });
    });

    $("#subCategoryForm").submit(function(e){

        e.preventDefault();

        var element = $("#subCategoryForm");
        $("button[type=submit]").prop('disabled', true);
        $.ajax({
            method: "post",
            url: "{{ route('admin.sub-category.store') }}",
            data: element.serializeArray(),
            dataType: "json",
            success: function (response) {
                $("button[type=submit]").prop('disabled', false);
                if(response['status'] == true){
                    window.location.href = '{{ route('admin.sub-category.index') }}';
                    $("#category").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');

                    $("#name").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');

                    $("#slug").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }else{

                    var errors = response['errors'];

                    if(errors['category']){
                        $("#category").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['category']);
                    }else{
                        $("#category").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                    }
                    if(errors['name']){
                        $("#name").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['name']);
                    }else{
                        $("#name").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('')
                    }

                    if(errors['slug']){
                        $("#slug").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['slug']);
                    }else{
                        $("#slug").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                    }
                }
            },error:function (e, exception){
                console.log('Something want to wrong');
            }
        });
    });
</script>
@endpush
