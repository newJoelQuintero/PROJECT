@extends('layouts.app')

@section('content')
<h1>Cita Registrada</h1>
<p>Tu cita ha sido registrada con éxito.</p>
<p><strong>Código de cita:</strong> {{ $codigo }}</p>
<p>Guarda este código, lo necesitarás para el historial clínico.</p>
@endsection
