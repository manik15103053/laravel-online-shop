@extends('admin.layouts.master')

@section('category', Request::is('admin/categories*') ? 'active' : '')
@section('title')
Category Update
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
                    <h1>Updated Category</h1>
                </div>
                <div class="col-sm-6 text-right">
                    <a href="{{ route('admin.category.index') }}" class="btn btn-primary">Back</a>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="container-fluid">
            <form action="" method="post" id="categoryForm" name="categoryForm">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="name">Name</label>
                                    <input type="text" name="name" id="name" value="{{ $category->name }}" class="form-control" placeholder="Name">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email">Slug</label>
                                    <input type="text" readonly name="slug" value="{{ $category->slug }}" id="slug" class="form-control" placeholder="Slug">
                                    <p></p>
                                </div>
                            </div>
                            <input type="hidden" id="image_id" name="image_id" value="">

                           <div class="col-md-6">
                                <label for="">Image</label>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Choose file">
                                    <div class="input-group-append">
                                      <a class="input-group-text" for="inputGroupSelect02" data-toggle="modal" data-target="#exampleModal">Upload</a>
                                    </div>
                                  </div>
                           </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email">Status</label>
                                    <select name="status" class="form-control" id="status">
                                        <option value="1" {{ $category->status == 1 ? 'selected' : '' }}>Active</option>
                                        <option value="0" {{ $category->status == 0 ? 'selected' : '' }}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12 mb-2">
                                <img src="{{ asset('uploads/category/'.$category->image) }}" width="150px" alt="">
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email">Show On Home</label>
                                    <select name="show_home" class="form-control" id="status">
                                        <option value="Yes" {{  $category->show_home == "Yes" ? "selected" : "" }}>Yes</option>
                                        <option value="No" {{  $category->show_home == "No" ? "selected" : "" }}>No</option>
                                    </select>
                                </div>
                            </div>
                            {{-- <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="">Image</label>
                                    <div id="image" class="dropzone dz-clickable">
                                        <div class="dz-message needsclick">
                                            <br>Drop files here or click to upload.<br><br>
                                        </div>
                                    </div>
                                </div>
                            </div>									 --}}
                        </div>
                    </div>
                </div>
                <div class="pb-5 pt-3">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <button type="reset" class="btn btn-danger">Cancel</button>
                </div>
            </form>
        </div>
        <!-- /.card -->
    </section>
    <!-- /.content -->
</div>

<!-- Button trigger modal -->
{{-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    Launch demo modal
  </button> --}}

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content ">
        <div class="modal-header">
          {{-- <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> --}}
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div id="image" class="dropzone dz-clickable">
                <div class="dz-message needsclick">
                    <br>Drop files here or click to upload.<br><br>
                </div>
            </div>
        </div>
        <div class="modal-footer">
          {{-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> --}}
          {{-- <button type="button" class="btn btn-primary">Save changes</button> --}}
        </div>
      </div>
    </div>
  </div>
@endsection

@push('js')
<script>
    $('#categoryForm').submit(function(e){
        e.preventDefault();
        var  element = $(this);
        $("button[type=submit]").prop('disabled', true);
        $.ajax({
            type: "post",
            url: "{{ route('admin.category.update',$category->id) }}",
            data: element.serializeArray(),
            dataType: "json",
            success: function (response) {
                $("button[type=submit]").prop('disabled', false)
                if(response['status'] == true){
                    window.location.href = "{{ route('admin.category.index') }}";

                    $('#name').removeClass('is-invalid')
                    .siblings('p')
                    .removeClass('invalid-feedback')
                    .html("");

                    $('#slug').removeClass('is-invalid')
                    .siblings('p')
                    .removeClass('invalid-feedback')
                    .html("");
                }else{

                    var errors = response['errors'];

                    if(errors['name']){
                        $('#name').addClass('is-invalid')
                        .siblings('p')
                        .addClass('invalid-feedback')
                        .html(errors['name']);
                    }else{
                        $('#name').removeClass('is-invalid')
                        .siblings('p')
                        .removeClass('invalid-feedback')
                        .html("");
                    }

                    if(errors['slug']){
                        $('#slug').addClass('is-invalid')
                        .siblings('p')
                        .addClass('invalid-feedback')
                        .html(errors['slug']);
                    }else{
                        $('#slug').removeClass('is-invalid')
                        .siblings('p')
                        .removeClass('invalid-feedback')
                        .html("");
                    }
                }


            },error: function(e, exception){
                console.log('Something went to wrong')
            }
        });
    });

    $("#name").on('input', function() {
    var element = $(this);
    $("button[type=submit]").prop('disabled', true)
    $.ajax({
        url: "{{ route('admin.category.get-slug') }}",
        type: 'get',
        data: { title: element.val() },
        dataType: 'json',
        success: function(response) {
            $("button[type=submit]").prop('disabled', false)
            if (response.status) {
                $("#slug").val(response.slug);
            }
        }
    });
});

//Dropzone
// Disable Dropzone autoDiscover (if you're manually initializing it).
Dropzone.autoDiscover = false;

const dropzone = $("#image").dropzone({
    init: function(){
        this.on('addedfile', function(file){
            if(this.files.length > 1){
                this.removeFile(this.files[0]);
            }
        });
    },
    url: "{{ route('admin.tempImage_create') }}",
    maxFiles: 1,
    paramName: 'image',
    addRemoveLinks: true,
    acceptedFile: "image/jpeg,image/png,image/gif",
    headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
     success: function(file, response){
        $("#image_id").val(response.image_id);
     }
});
</script>
@endpush
