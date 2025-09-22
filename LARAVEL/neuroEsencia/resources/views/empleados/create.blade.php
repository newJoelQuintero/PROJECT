<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <title>Registrar Empleado</title>
</head>
<body>
    @extends('layouts.app')

    @section('content')
    <div class="body__container">
        <form action="{{ url('/empleados') }}" method="POST" class="form">
            @csrf
            <h1 class="title">Registrar Empleado</h1>


            <div class="form__grid">
                <div class="form__container select-wrapper">
                    <label>Tipo Documento</label>
                    <select name="tipo_documento" required>
                        <option value="" disabled selected>Seleccione un tipo</option>
                        <option value="CC">Cédula de Ciudadanía</option>
                        <option value="TI">Tarjeta de Identidad</option>
                        <option value="CE">Cédula de Extranjería</option>
                        <option value="PAS">Pasaporte</option>
                    </select>
                </div>

                <div class="form__container">
                    <label>Número de documento</label>
                    <input type="text" name="dni_empleado" required>
                </div>
            </div>


            <div class="form__grid">
                <div class="form__container">
                    <label>Nombre</label>
                    <input type="text" name="nombre" required>
                </div>

                <div class="form__container">
                    <label>Dirección</label>
                    <input type="text" name="direccion" required>
                </div>
            </div>


            <div class="form__grid">
                <div class="form__container">
                    <label>Teléfono</label>
                    <input type="text" name="telefono" required>
                </div>

                <div class="form__container">
                    <label>Usuario</label>
                    <input type="text" name="usuario" required>
                </div>
            </div>


            <div class="form__grid">
                <div class="form__container">
                    <label>Contraseña</label>
                    <input type="password" name="contrasena" required>
                </div>

                <div class="form__container select-wrapper">
                    <label>Rol</label>
                    <select name="id_rol" required>
                        @foreach($roles as $rol)
                            <option value="{{ $rol->id_rol }}">{{ $rol->nombre_rol }}</option>
                        @endforeach
                    </select>
                </div>
            </div>


            <div class="form__container">
                <button type="submit">Guardar</button>
            </div>
        </form>
    </div>
    @endsection
</body>
</html>
