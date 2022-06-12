@component('mail::message')
# Novo Contato

<p>Contato: {{ $name }} <{{ $email }}></p>
<p>Telefone {{ $cell }}</p>

<p>{{$message}}<p>

  <p> *Esse email é enviado auto através do sistema!</p>
@endcomponent
