<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <title>Lista de Facturas</title>
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
                <h1 class="title">Lista de Facturas</h1>

                <div class="actions__bar">
                    <a href="{{ url('/facturas/create') }}" class="btn-primary">+ Nueva Factura</a>
                    <input type="text" id="searchInput" class="search-bar" placeholder="Buscar factura...">
                </div>

                <div class="table__wrapper">
                    <table class="table" id="facturasTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Método de Pago</th>
                                <th>Total</th>
                                <th>Empleado</th>
                                <th>Paciente</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($facturas as $factura)
                            <tr>
                                <td>{{ $factura->id_factura }}</td>
                                <td>{{ $factura->tipo_metodo_pago }}</td>
                                <td>${{ number_format($factura->total_factura, 2, ',', '.') }}</td>
                                <td>{{ $factura->nombre_empleado }}</td>
                                <td>{{ $factura->nombre_paciente }}</td>
                                <td>
                                    <a href="{{ url('/facturas/'.$factura->id_factura.'/edit') }}" class="btn-edit">Editar</a>
                                    <form action="{{ url('/facturas/'.$factura->id_factura) }}" method="POST" class="inline-form">
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
            let rows = document.querySelectorAll("#facturasTable tbody tr");

            rows.forEach(row => {
                let text = row.innerText.toLowerCase();
                row.style.display = text.includes(filter) ? "" : "none";
            });
        });
    </script>
    @endsection
</body>
</html>
