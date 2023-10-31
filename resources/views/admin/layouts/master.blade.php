<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="csrf-token" content="{{ csrf_token() }}">
		<title>@yield('title')</title>


		<!-- Google Font: Source Sans Pro -->
		@include('admin.layouts.partial.styles')
		<link rel="stylesheet" href="{{ asset('backend/plugins/dropzone/min/dropzone.min.css') }}">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


		@stack('css')
	</head>
	<body class="hold-transition sidebar-mini">
		<!-- Site wrapper -->
		<div class="wrapper">
			<!-- Navbar -->
			@include('admin.layouts.partial.navbar')
			<!-- /.navbar -->
			<!-- Main Sidebar Container -->
			<aside class="main-sidebar sidebar-dark-primary elevation-4">
				<!-- Brand Logo -->
				<a href="#" class="brand-link">
					<img src="{{ asset('backend') }}/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
					<span class="brand-text font-weight-light">Online Shop</span>
				</a>
				<!-- Sidebar -->
				@include('admin.layouts.partial.sidebar')
				<!-- /.sidebar -->
         	</aside>
			<!-- Content Wrapper. Contains page content -->
			@yield('main-content')
			<!-- /.content-wrapper -->
			@include('admin.layouts.partial.footer')
			
		</div>
		<!-- ./wrapper -->
		<!-- jQuery -->
		@include('admin.layouts.partial.scripts')
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script src="{{ asset('backend/plugins/dropzone/min/dropzone.min.js') }}"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


		<script>
			$.ajaxSetup({
					headers: {
						'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
					}
				});
		</script>

			@if (Session::has('success'))
				<script>
					toastr.options = {
						'progressBar': true,
						'closeButton': true,
						'timeout': 120000, // Adjust the timeout as needed
					};
					toastr.success("{{ Session::get('success') }}", 'Success!');
				</script>
				@elseif (Session::has('error'))
				<script>
					toastr.options = {
						'progressBar': true,
						'closeButton': true,
						'timeout': 120000, // Adjust the timeout as needed
					};
					toastr.error("{{ Session::get('error') }}", 'Error!');
				</script>
			@endif

		@stack('js')
	</body>
</html>