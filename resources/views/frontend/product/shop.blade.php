@extends('frontend.layouts.master')
@section('title')
Shop
@endsection
@section('main')
<main>
    <section class="section-5 pt-3 pb-3 mb-3 bg-white">
        <div class="container">
            <div class="light-font">
                <ol class="breadcrumb primary-color mb-0">
                    <li class="breadcrumb-item"><a class="white-text" href="#">Home</a></li>
                    <li class="breadcrumb-item active">Shop</li>
                </ol>
            </div>
        </div>
    </section>

    <section class="section-6 pt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-3 sidebar">
                    <div class="sub-title">
                        <h2>Categories</h3>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            @if ($categories->isNotEmpty())
                            <div class="accordion accordion-flush" id="accordionExample">
                                @foreach ($categories as $key => $category_item )
                                    <div class="accordion-item">
                                        @if ($category_item->subCategory->isNotEmpty())
                                        <h2 class="accordion-header" id="headingOne">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne{{ $key }}" aria-expanded="false" aria-controls="collapseOne{{ $key }}">
                                                {{ $category_item->name ?? "" }}
                                            </button>
                                        </h2>
                                        @else
                                        <a href="{{ route('front.shop',$category_item->slug) }}" class="nav-item nav-link {{ ($categorySelected == $category_item->id) ? 'text-primary' : '' }}">{{ $category_item->name ?? ""  }}</a>
                                        @endif
                                        <div id="collapseOne{{ $key }}" class="accordion-collapse collapse {{ ($categorySelected == $category_item->id) ? 'show' : '' }}" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                                            @if ($category_item->subCategory->isNotEmpty())
                                            <div class="accordion-body">
                                                <div class="navbar-nav">
                                                    @foreach ($category_item->subCategory as $key=> $sub_cat_item)
                                                    <a href="{{ route('front.shop',[$category_item->slug, $sub_cat_item->slug]) }}" class="nav-item nav-link {{ ($subCategorySelected == $sub_cat_item->id) ? 'text-primary' : '' }}">{{ $sub_cat_item->name ?? ""  }}</a>
                                                    @endforeach
                                                </div>
                                            </div>
                                            @endif
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            @endif
                        </div>
                    </div>

                    <div class="sub-title mt-5">
                        <h2>Brand</h3>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            @if ($brands->isNotEmpty())
                                @foreach ($brands as $key=> $brand_item)
                                    <div class="form-check mb-2">
                                        <input  class="form-check-input brand-label" name="brand[]" type="checkbox" value="{{ $brand_item->id }}" id="brand{{ $brand_item->id }}">
                                        <label class="form-check-label" for="brand{{ $brand_item->id }}">
                                            {{ $brand_item->name ?? "" }}
                                        </label>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                    </div>

                    <div class="sub-title mt-5">
                        <h2>Price</h3>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    $0-$100
                                </label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                                <label class="form-check-label" for="flexCheckChecked">
                                    $100-$200
                                </label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                                <label class="form-check-label" for="flexCheckChecked">
                                    $200-$500
                                </label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                                <label class="form-check-label" for="flexCheckChecked">
                                    $500+
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-end mb-4">
                                <div class="ml-2">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-bs-toggle="dropdown">Sorting</button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#">Latest</a>
                                            <a class="dropdown-item" href="#">Price High</a>
                                            <a class="dropdown-item" href="#">Price Low</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="products">
                        @if ($products->isNotempty())
                            @foreach ($products as $key=> $product_item)
                                @php
                                    $product_image = $product_item->product_image->first()
                                @endphp
                                <div class="col-md-4">
                                    <div class="card product-card" id="filtered-products-container">
                                        <div class="product-image position-relative">
                                            @if ($product_image->image)
                                            <a href="" class="product-img"><img class="card-img-top" src="{{ asset('uploads/product/small/'.$product_image->image) }}" alt=""></a>
                                            @else
                                            <a href="" class="product-img"><img class="card-img-top" src="{{ asset('frontend') }}/images/product-1.jpg" alt=""></a>
                                            @endif
                                            <a class="whishlist" href="222"><i class="far fa-heart"></i></a>

                                            <div class="product-action">
                                                <a class="btn btn-dark" href="#">
                                                    <i class="fa fa-shopping-cart"></i> Add To Cart
                                                </a>
                                            </div>
                                        </div>
                                        <div class="card-body text-center mt-3">
                                            <a class="h6 link" href="product.php">{{ $product_item->title ?? "" }}</a>
                                            <div class="price mt-2">
                                                <span class="h5"><strong>{{ $product_item->price ?? "" }}</strong></span>
                                                @if ($product_item->compare_price > 0)
                                                <span class="h6 text-underline"><del>{{ $product_item->compare_price ?? "" }}</del></span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        @endif
                    </div>


                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
@endsection
@push('js')
<script>
    $(document).ready(function () {
        $('.brand-label').change(function () {
            filterProducts();
        });
        let category = '{{ $categorySlug }}';
        let subCategory = '{{ $subCategorySlug }}';
        function filterProducts() {
            var selectedBrands = $('.brand-label:checked').map(function() {
                return this.value;
            }).get();

            $.ajax({
                type: 'GET',
                url: '{{ route('front.shop') }}', // Replace this with the actual route URL
                data: { 
                    brand: selectedBrands,
                    categorySlug: category,
                    subCategorySlug: subCategory
                 },
                success: function (response) {
                    const products = response.data.products;
                    console.log(response);
                    let prod = '';
                    $.each(products,function(key, item){
                        prod += `
                            <div class="col-md-4">
                                <div class="card product-card" id="filtered-products-container">
                                    <div class="product-image position-relative">
                                        <a href="" class="product-img"><img class="card-img-top" src="${item?.product_image[0]?.image ? '/uploads/product/small/' + item?.product_image[0]?.image : '/frontend/images/product-1.jpg'}" alt=""></a>
                                        <a class="whishlist" href="222"><i class="far fa-heart"></i></a>
                                        <div class="product-action">
                                            <a class="btn btn-dark" href="#">
                                                <i class="fa fa-shopping-cart"></i> Add To Cart
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-body text-center mt-3">
                                        <a class="h6 link" href="product.php">${item.title}</a>
                                        <div class="price mt-2">
                                            <span class="h5"><strong>${item.price}</strong></span>
                                            ${item.compare_price > 0 ? '<span class="h6 text-underline"><del>' + item.compare_price + '</del></span>' : ''}
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        console.log(item?.product_image[0]?.image);   
                    })
                    $('#products').empty();
                    $('#products').html(prod);
                    // console.log("Data",products);
                }
            });
        }
    });
</script>


@endpush
