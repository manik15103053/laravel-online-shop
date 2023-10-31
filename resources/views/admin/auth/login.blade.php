<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Admin Login</title>
		<!-- Google Font: Source Sans Pro -->
		@include('admin.auth.styles')
	</head>
	<body class="hold-transition login-page">
		<div class="login-box">
			<!-- /.login-logo -->
			<div class="card card-outline card-primary">
			  	<div class="card-header text-center">
					<a href="#" class="h3">Admin Login</a>
			  	</div>
			  	<div class="card-body">
					<p class="login-box-msg text-danger">
						@if(Session::get('error'))
						{{ Session::get('error') }}

                    	@endif
						</p>
					<form action="{{ route('admin.authenticate') }}" method="post">
						@csrf
				  		<div class="input-group mb-3">
							<input type="email" class=" form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" placeholder="Email">
							<div class="input-group-append">
					  			<div class="input-group-text">
									<span class="fas fa-envelope"></span>
					  			</div>
							</div>
							@error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
				  		</div>
				  		<div class="input-group mb-3">
							<input type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Password">
							<div class="input-group-append">
					  			<div class="input-group-text">
									<span class="fas fa-lock"></span>
					  			</div>
							</div>
							@error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
				  		</div>
				  		<div class="row">
							<div class="col-8">
					  			<div class="icheck-primary">
									<input type="checkbox" id="remember">
									<label for="remember">
						  				Remember Me
									</label>
					  			</div>
							</div>
							<!-- /.col -->
							<div class="col-4">
					  			<button type="submit" class="btn btn-primary btn-block">Login</button>
							</div>
							<!-- /.col -->
				  		</div>
					</form>
		  			<p class="mb-1 mt-3">
				  		<a href="forgot-password.html">I forgot my password</a>
					</p>					
			  	</div>
			  	<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
		<!-- ./wrapper -->
		<!-- jQuery -->
		@include('admin.auth.scripts')
	</body>
</html>