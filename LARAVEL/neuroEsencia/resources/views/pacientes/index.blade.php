<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <title>Lista de Pacientes</title>
</head>
<body>
    @extends('layouts.app')

@section('content')
<div class="layout">
    <aside class="sidebar">
        <ul class="sidebar__list">
            <li class="sidebar__element">
                <img src="../IMG/logo.png" alt="logo" class="sidebar__icon sidebar__icon--logo">
                <div class="sidebar__hide">
                    <p class="sidebar__text">Neuroesencia</p>
                </div>
            </li>
            <li class="sidebar__element">
                <i class="fa-solid fa-house sidebar__icon"></i>
                <div class="sidebar__hide">
                    <a href="../Controller/controller.html" class="sidebar__text">Inicio</a>
                </div>
            </li>
            <li class="list__item list__item--click sidebar__element">
                <i class="fa-solid fa-cube sidebar__icon"></i>
                <div class="list__bottom list__bottom--click sidebar__hide">
                    <a href="#" class="nav__link">Modulos</a>
                    <i class="fa-solid fa-chevron-down list__arrow"></i>
                </div>
                <ul class="list__show">
                    <li class="list__inside"><a href="../CLASE_EMPLEADO/CONSULTA_EMPLEADO.php" class="nav__link nav__link--inside">Empleado</a></li>
                    <li class="list__inside"><a href="../CLASE_LOGIN_EMPLEADO/CONSULTA_LOGINE.php" class="nav__link nav__link--inside">L.Empleado</a></li>
                </ul>
            </li>
            <li class="list__item list__item--click sidebar__element">
                <i class="fa-solid fa-file sidebar__icon"></i>
                <div class="list__bottom list__bottom--click sidebar__hide">
                    <a href="#" class="nav__link">Reportes</a>
                    <i class="fa-solid fa-chevron-down list__arrow"></i>
                </div>
                <ul class="list__show">
                    <li class="list__inside">
                        <a href="../Vistas/CITA_EMPLEADO/CITA_EMPLEADO.php" class="nav__link nav__link--inside">C.E</a>
                        <a href="../Vistas/PRODUCTO_ALMACENAMIENTO/PRODUCTO_A.php" class="nav__link nav__link--inside">Inventario</a>
                    </li>
                </ul>
            </li>
            <li class="sidebar__element">
                <i class="fa-solid fa-moon sidebar__icon"></i>
                <div class="sidebar__hide">
                    <button class="btn-dark" id="bdark">Modo Oscuro</button>
                </div>
            </li>
        </ul>
    </aside>
    <div class="body__container">
        <div class="form">
            <h1 class="title">Lista de Pacientes</h1>

            <div class="actions__bar">
                <a href="{{ url('/pacientes/create') }}" class="btn-primary">+ Nuevo Paciente</a>
                <input type="text" id="searchInput" class="search-bar" placeholder="Buscar paciente...">
            </div>

            <div class="table__wrapper">
                <table class="table" id="pacientesTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Documento</th>
                            <th>DNI</th>
                            <th>Nombre</th>
                            <th>Direccion</th>
                            <th>Teléfono</th>
                            <th>Usuario</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($pacientes as $paciente)
                        <tr>
                            <td>{{ $paciente->id_paciente }}</td>
                            <td>{{ $paciente->tipo_documento }}</td>
                            <td>{{ $paciente->dni_cliente }}</td>
                            <td>{{ $paciente->nombre }}</td>
                            <td>{{ $paciente->direccion }}</td>
                            <td>{{ $paciente->telefono }}</td>
                            <td>{{ $paciente->usuario }}</td>
                            <td>
                                <a href="{{ url('/pacientes/'.$paciente->id_paciente.'/edit') }}" class="btn-edit">Editar</a>
                                <form action="{{ url('/pacientes/'.$paciente->id_paciente) }}" method="POST" class="inline-form">
                                    @csrf @method('DELETE')
                                    <button type="submit" class="btn-delete">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('searchInput').addEventListener('keyup', function () {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll("#pacientesTable tbody tr");

        rows.forEach(row => {
            let text = row.innerText.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    });
</script>
@endsection
</body>
</html>
