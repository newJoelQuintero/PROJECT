<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite(['resources/css/app.css', 'resources/css/formularios.css', 'resources/js/app.js'])
    <title>Cita</title>
</head>
<body>
    @extends('layouts.app')

    @section('content')
    <div class="body__container">
        <form action="{{ url('/citas') }}" method="POST" class="form">
            @csrf
            <h1 class="title">Registrar Cita</h1>

            {{-- Calendario mejorado con Flatpickr --}}
            <div class="form__container">
                <label>Hora Cita</label>
                <input type="text" name="hora_cita" required placeholder="Selecciona fecha y hora">
            </div>

            {{-- Lugar de la cita como select --}}
            <div class="form__container select-wrapper">
                <label>Lugar Cita</label>
                <select name="lugar_cita" required>
                    <option value="" disabled selected>Seleccione un lugar</option>
                    <option value="Consultorio 1">Consultorio 1</option>
                    <option value="Consultorio 2">Consultorio 2</option>
                    <option value="Sala Terapia">Sala de Terapia</option>
                    <option value="Sala Reuniones">Sala de Reuniones</option>
                </select>
            </div>

            <div class="form__container">
                <label>Valor Cita</label>
                <input type="number" step="0.01" name="valor_cita" required>
            </div>

            <div class="form__container">
                <label>Numero de documento del Paciente</label>
                <input type="text" name="dni_cliente" required>
            </div>

            <div class="form__container">
                <button type="submit">Registrar Cita</button>
            </div>
        </form>
    </div>
    @endsection
</body>
</html>
