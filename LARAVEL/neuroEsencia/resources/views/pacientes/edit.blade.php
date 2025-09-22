@extends('layouts.app')

@section('content')
<h1>Editar Paciente</h1>

<form action="{{ url('/pacientes/'.$paciente->id_paciente) }}" method="POST">
    @csrf @method('PUT')

    <label>Tipo Documento:</label>
    <input type="text" name="tipo_documento" value="{{ $paciente->tipo_documento }}" required><br>

    <label>DNI:</label>
    <input type="text" name="dni_cliente" value="{{ $paciente->dni_cliente }}" required><br>

    <label>Nombre:</label>
    <input type="text" name="nombre" value="{{ $paciente->nombre }}" required><br>

    <label>Dirección:</label>
    <input type="text" name="direccion" value="{{ $paciente->direccion }}" required><br>

    <label>Teléfono:</label>
    <input type="text" name="telefono" value="{{ $paciente->telefono }}" required><br>

    <label>Usuario:</label>
    <input type="text" name="usuario" value="{{ $paciente->usuario }}" required><br>

    <label>Nueva Contraseña (opcional):</label>
    <input type="password" name="contrasena"><br>

    <button type="submit">Actualizar</button>
</form>
@endsection
