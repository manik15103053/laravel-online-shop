@extends('admin.layouts.master')

@section('brand', Request::is('admin/brands*') ? 'active' : '')
@section('title')
Brand Create
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
                    <h1>Create Brand</h1>
                </div>
                <div class="col-sm-6 text-right">
                    <a href="{{ route('admin.brand.index') }}" class="btn btn-primary">Back</a>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="container-fluid">
            <form action="" method="post" id="brandForm" name="brandForm">
                <div class="card">
                    <div class="card-body">								
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="name">Name</label>
                                    <input type="text" name="name" id="name" class="form-control" placeholder="Brand Name">
                                    <p></p>	
                                </div>
                            </div>
                            <div class="col-md-6">
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
            url: "{{ route('admin.brand.getBrand.slug') }}",
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

    $("#brandForm").submit(function(e){
        
        e.preventDefault();

        var element = $("#brandForm");
        $("button[type=submit]").prop('disabled', true);
        $.ajax({
            method: "post",
            url: "{{ route('admin.brand.store') }}",
            data: element.serializeArray(),
            dataType: "json",
            success: function (response) {
                $("button[type=submit]").prop('disabled', false);
                if(response['status'] == true){
                    window.location.href = '{{ route('admin.brand.index') }}';

                    $("#name").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');

                    $("#slug").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }else{

                    var errors = response['errors'];

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