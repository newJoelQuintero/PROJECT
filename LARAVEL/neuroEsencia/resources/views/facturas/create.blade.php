<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <title>Registrar Factura</title>
</head>
<body>
    @extends('layouts.app')

    @section('content')
    <div class="body__container">
        <form action="{{ url('/facturas') }}" method="POST" class="form">
            @csrf
            <h1 class="title">Registrar Factura</h1>

            <div class="form__container select-wrapper">
                <label>Método de Pago:</label>
                <select name="tipo_metodo_pago" required>
                    <option value="" disabled selected>Seleccione un método</option>
                    <option value="Efectivo">Efectivo</option>
                    <option value="Tarjeta Crédito">Tarjeta Crédito</option>
                    <option value="Tarjeta Débito">Tarjeta Débito</option>
                    <option value="Transferencia">Transferencia</option>
                </select>
            </div>

            <div class="form__container">
                <label>Total:</label>
                <input type="number" name="total_factura" required>
            </div>

            <div class="form__container">
                <label>Numero de documento del empleado:</label>
                <input type="text" name="dni_empleado" required>
            </div>

            <div class="form__container">
                <label>Numero de documento del paciente:</label>
                <input type="text" name="dni_cliente" required>
            </div>

            <div class="form__container">
                <button type="submit">Guardar</button>
            </div>
        </form>
    </div>
    @endsection
</body>
</html>
