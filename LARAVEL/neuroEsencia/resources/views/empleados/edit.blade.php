@extends('layouts.app')
@section('content')
<h1>Editar Empleado</h1>

<form action="{{ url('/empleados/'.$empleado->id_empleado) }}" method="POST">
    @csrf 
    @method('PUT')

    <label>Tipo Documento:</label>
    <input type="text" name="tipo_documento" value="{{ $empleado->tipo_documento }}" required><br>

    <label>DNI:</label>
    <input type="text" name="dni_empleado" value="{{ $empleado->dni_empleado }}" required><br>

    <label>Nombre:</label>
    <input type="text" name="nombre" value="{{ $empleado->nombre }}" required><br>

    <label>Dirección:</label>
    <input type="text" name="direccion" value="{{ $empleado->direccion }}" required><br>

    <label>Teléfono:</label>
    <input type="text" name="telefono" value="{{ $empleado->telefono }}" required><br>

    <label>Usuario:</label>
    <input type="text" name="usuario" value="{{ $empleado->usuario }}" required><br>

    <label>Nueva Contraseña (opcional):</label>
    <input type="password" name="contrasena"><br>

    <label>Rol:</label>
    <select name="id_rol" required>
        @foreach($roles as $rol)
            <option value="{{ $rol->id_rol }}" 
                {{ $empleado->id_rol == $rol->id_rol ? 'selected' : '' }}>
                {{ $rol->nombre_rol }}
            </option>
        @endforeach
    </select><br><br>

    <button type="submit">Actualizar</button>
</form>
@endsection
