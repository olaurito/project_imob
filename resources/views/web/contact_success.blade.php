@extends('web.master.master')

@section('content')
    <div class="container p-5">
        <h2 class="texdt-center tezt-front ">Seu e-mail foi enviado com sucesso! Em breve entraremos em contato. </b>
        </h2>
        <p class="text-center"><a href="{{ url()->previous() }}" class="text-front">...Continuar Navegando</a></p>

    </div>
@endsection
