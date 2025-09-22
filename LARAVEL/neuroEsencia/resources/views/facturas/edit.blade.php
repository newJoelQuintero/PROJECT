@extends('layouts.app')

@section('content')
<h1>Editar Factura</h1>

<form action="{{ url('/facturas/'.$factura->id_factura) }}" method="POST">
    @csrf @method('PUT')

    <label>Método de Pago:</label>
    <input type="text" name="tipo_metodo_pago" value="{{ $factura->tipo_metodo_pago }}" required><br>

    <label>Total:</label>
    <input type="number" name="total_factura" value="{{ $factura->total_factura }}" required><br>

    <label>ID Empleado:</label>
    <input type="text" name="id_empleado" value="{{ $factura->id_empleado }}" required><br>

    <label>ID Paciente:</label>
    <input type="text" name="id_paciente" value="{{ $factura->id_paciente }}" required><br>

    <button type="submit">Actualizar</button>
</form>
@endsection
