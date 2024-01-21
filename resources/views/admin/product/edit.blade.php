@extends('admin.layouts.master')

@section('product', Request::is('admin/products*') ? 'active' : '')
@section('title')
Update Product
@endsection
@push('css')
<link rel="stylesheet" href="{{ asset ('backend/plugins/summernote/summernote-bs4.min.css') }}">

@endpush
@section('main-content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid my-2">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Edit Product</h1>
                </div>
                <div class="col-sm-6 text-right">
                    <a href="{{ route('admin.product.index') }}" class="btn btn-primary">Back</a>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row">
                                <form action="" method="post" id="productForm" name="productForm">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="title">Title</label>
                                        <input type="text" name="title" id="title" value="{{ $product->title }}" class="form-control" placeholder="Title">
                                        <p class="error"></p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="slug">Slug</label>
                                        <input type="text" name="slug" id="slug" readonly value="{{ $product->slug }}" class="form-control" placeholder="Slug">
                                        <p class="error"></p>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="description">Description</label>
                                        <textarea name="description" id="description" cols="30" rows="10" class="summernote" placeholder="Description">{!! $product->description !!}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h2 class="h4 mb-3">Media</h2>
                            <div id="image" class="dropzone dz-clickable">
                                <div class="dz-message needsclick">
                                    <br>Drop files here or click to upload.<br><br>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" id="product-gallery">
                        @foreach ($product_images as $item_image)
                            <div class='col-md-3' id="image-row-{{ $item_image->id }}">
                                <div class="card">
                                    <img src="{{ asset('uploads/product/small/'.$item_image->image) }}" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <a href="javascript:void(0)" onclick="deleteImage({{ $item_image->id }})" class="btn btn-danger btn-sm text-center">Delete</a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h2 class="h4 mb-3">Pricing</h2>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="price">Price</label>
                                        <input type="text" name="price" id="price" value="{{ $product->price }}" class="form-control" placeholder="Price">
                                        <p class="error"></p>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="compare_price">Compare at Price</label>
                                        <input type="text" name="compare_price" id="compare_price" value="{{ $product->compare_price }}" class="form-control" placeholder="Compare Price">
                                        <p class="text-muted mt-3">
                                            To show a reduced price, move the product’s original price into Compare at price. Enter a lower value into Price.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h2 class="h4 mb-3">Inventory</h2>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="sku">SKU (Stock Keeping Unit)</label>
                                        <input type="text" name="sku" id="sku" value="{{ $product->sku }}" class="form-control" placeholder="sku">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="barcode">Barcode</label>
                                        <input type="text" name="barcode" id="barcode" value="{{ $product->barcode }}" class="form-control" placeholder="Barcode">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <input type="hidden" name="track_qty" value="No">
                                        <div class="custom-control custom-checkbox">
                                            <input class="custom-control-input" type="checkbox" id="track_qty" value="Yes" {{ $product->track_qty == "Yes"? "checked" : "" }} name="track_qty" >
                                            <label for="track_qty" class="custom-control-label">Track Quantity</label>
                                            <p class="error"></p>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <input type="number" min="0" name="qty" id="qty" value="{{ $product->qty }}" class="form-control" placeholder="Qty">
                                        <p class="error"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h2 class="h4 mb-3">Product status</h2>
                            <div class="mb-3">
                                <select name="status" id="status" class="form-control">
                                    <option value="1" {{ $product->status == "1" ? "selected" : "" }}>Active</option>
                                    <option value="0" {{ $product->status == "0" ? "selected" : "" }}>Block</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h2 class="h4  mb-3">Product category</h2>
                            <div class="mb-3">
                                <label for="category">Category</label>
                                <select name="category" id="category" class="form-control">
                                    <option value="" disabled selected>Select Category</option>
                                    @if ($categories->isNotEmpty())
                                        @foreach ($categories as $item)
                                        <option value="{{ $item->id }}" {{ $product->category_id == $item->id ? "selected" : "" }}>{{ $item->name }}</option>
                                        @endforeach
                                    @endif
                                </select>
                                <p class="error"></p>
                            </div>
                            <div class="mb-3">
                                <label for="category">Sub category</label>
                                <select name="sub_category" id="sub_category" class="form-control">
                                    <option value="" disabled selected>Select a Sub Category</option>
                                    @foreach ($subCategory as $subCat)
                                        <option value="{{ $subCat->id }}" {{ $product->sub_category_id == $subCat->id ? "selected" : "" }}>{{ $subCat->name }}</option>
                                    @endforeach

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h2 class="h4 mb-3">Product brand</h2>
                            <div class="mb-3">
                                <select name="brand" id="brand" class="form-control">
                                    @if($brands->isNotEmpty())
                                    <option value="">Select a Brand</option>
                                    @foreach ($brands as $item)
                                    <option value="{{ $item->id }}" {{ $product->brand_id == $item->id ? "selected" : ""}}>{{ $item->name }}</option>
                                    @endforeach
                                    @endif
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h2 class="h4 mb-3">Featured product</h2>
                            <div class="mb-3">
                                <select name="is_featured" id="is_featured" class="form-control">
                                    <option value="No" {{ $product->is_featured == "No" ? "selected" : "" }}>No</option>
                                    <option value="Yes" {{ $product->is_featured == "Yes" ? "selected" : "" }}>Yes</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="image_new_array" id="image_array">
            <div class="pb-5 pt-3">
                <button type="submit" class="btn btn-primary">Create</button>
                <a href="products.html" class="btn btn-outline-dark ml-3">Cancel</a>
            </div>
        </form>
        </div>
        <!-- /.card -->
    </section>
    <!-- /.content -->
</div>
@endsection

@push('js')
<script src="{{ asset('backend/plugins/summernote/summernote-bs4.min.js') }}"></script>

<script>
    var image_new_array = [] ;
 $("#title").on('input',function(){
    var element = $(this);
    $("button[type=submit]").prop('disabled', true);
    $.ajax({
        type: "get",
        url: "{{ route('admin.product.getProduct.slug') }}",
        data: { title : element.val()
        },
        dataType: "json",
        success: function (response) {
            $("button[type=submit]").prop('disabled', false);
            if(response.status){
                $("#slug").val(response.slug);
            }
        }
    });
 });

//Sub Category by Category
$("#category").change(function(){
    var category_id = $(this).val();
    $.ajax({
        method: "get",
        url: "{{ route('admin.product.getSubCategoryByCategory') }}",
        data: { category_id : category_id},
        dataType: "json",
        success: function (response) {
            $("#sub_category").find('option').not(':first').remove();
            $.each(response['subCategory'], function(key, item){
                $("#sub_category").append(`<option value = '${item.id}'>${item.name}</option>`);
            });
        }
    });
});

    //Product Validation
    $("#productForm").submit(function(e){
        e.preventDefault();

        var formArray = $(this).serializeArray();
        $("button[type=submit]").prop('disabled', true);
        $.ajax({
            method: "post",
            url: "{{ route('admin.product.update',$product->id) }}",
            data: formArray,
            dataType: "json",
            success: function (response) {
                $("button[type=submit]").prop('disabled', false);
                if(response['status'] == true){
                    window.location.href = '{{ route('admin.product.index') }}';
                }else{
                    var errors = response['errors'];

                    $('.error').removeClass('invalid-feedback').html('');
                    $("input[type='text'], select, input[type='number']").removeClass('is-invalid');
                    $.each(errors, function(key, value){
                        $(`#${key}`).addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(value);
                    })

                }
            },
            error:function(){
                console.log('Something want to wrong');
            }
        });
    });
    //End Product
    //Drop zoon
    Dropzone.autoDiscover = false;
    $(function () {
        // Summernote
        $('.summernote').summernote({
            height: '300px'
        });

       //Dropzone
// Disable Dropzone autoDiscover (if you're manually initializing it).

const dropzone = new Dropzone("#image", {
    url: "{{ route('admin.tempImage_create') }}",
    maxFiles: 10,
    paramName: 'image',
    addRemoveLinks: true,
    acceptedFiles: "image/jpeg,image/png,image/gif", // acceptedFiles, not acceptedFile
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    },
    success: function(file, response) {

        image_new_array.push(response.image_id);
        $("#image_array").val(image_new_array)
        var html = `<div class='col-md-3' id="image-row-${response.image_id}">
                        <div class="card">
                            <img src="${response.imagePath}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <a href="javascript:void(0)" onclick="deleteImage(${response.image_id})" class="btn btn-danger btn-sm text-center">Delete</a>
                            </div>
                        </div>
                    </div>`;
        $("#product-gallery").append(html);


    },
    complete:function(file){
        this.removeFile(file);
    }
});



});
///Delete Image
function deleteImage(id){
    $("#image-row-"+ id).remove();
}

</script>
<script>

</script>
@endpush
