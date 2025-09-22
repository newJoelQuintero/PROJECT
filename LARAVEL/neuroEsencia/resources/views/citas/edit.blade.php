@extends('layouts.app')

@section('content')
<h1>Editar Cita</h1>

<form action="{{ url('/citas/'.$cita->id_cita) }}" method="POST">
    @csrf @method('PUT')

    <label>Hora:</label>
    <input type="datetime-local" name="hora_cita" value="{{ \Carbon\Carbon::parse($cita->hora_cita)->format('Y-m-d\TH:i') }}" required><br>

    <label>Lugar:</label>
    <input type="text" name="lugar_cita" value="{{ $cita->lugar_cita }}" required><br>

    <label>Valor:</label>
    <input type="number" step="0.01" name="valor_cita" value="{{ $cita->valor_cita }}" required><br>

    <label>ID Paciente:</label>
    <input type="text" name="id_paciente" value="{{ $cita->id_paciente }}" required><br>

    <button type="submit">Actualizar</button>
</form>
@endsection
