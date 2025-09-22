@extends('layouts.app')

@section('content')
<div class="body__container">
    <div class="form">
        <h1 class="title">Detalles del Empleado</h1>

        <table class="table">
            <tr>
                <th>Código:</th>
                <td>{{ $empleado->id_empleado }}</td>
            </tr>
            <tr>
                <th>Tipo Documento:</th>
                <td>{{ $empleado->tipo_documento }}</td>
            </tr>
            <tr>
                <th>Número Documento:</th>
                <td>{{ $empleado->dni_empleado }}</td>
            </tr>
            <tr>
                <th>Nombre:</th>
                <td>{{ $empleado->nombre }}</td>
            </tr>
            <tr>
                <th>Teléfono:</th>
                <td>{{ $empleado->telefono }}</td>
            </tr>
            <tr>
                <th>Usuario:</th>
                <td>{{ $empleado->usuario }}</td>
            </tr>
            <tr>
                <th>Rol:</th>
                <td>{{ $empleado->nombre_rol }}</td>
            </tr>
        </table>

        <div class="actions__bar">
            <a href="{{ url('/empleados') }}" class="btn-primary">← Volver</a>
        </div>
    </div>
</div>
@endsection
