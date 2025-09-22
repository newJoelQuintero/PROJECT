<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EmpleadoController extends Controller
{
    public function index()
    {
        $empleados = DB::select("
            SELECT e.*, r.nombre_rol
            FROM EMPLEADO e
            INNER JOIN ROL r ON e.id_rol = r.id_rol
        ");

        return view('empleados.index', compact('empleados'));
    }

    public function create()
    {
        $roles = DB::select("SELECT * FROM ROL");
        return view('empleados.create', compact('roles'));
    }

    public function store(Request $request)
    {
        $rol = DB::select("SELECT nombre_rol FROM ROL WHERE id_rol = ?", [$request->id_rol]);

        DB::statement("CALL PROCEDIMIENTO_INSERTAR_EMPLEADO(?, ?, ?, ?, ?, ?, ?, ?)", [
            $request->tipo_documento,
            $request->dni_empleado,
            $request->nombre,
            $request->direccion,
            $request->telefono,
            $request->usuario,
            bcrypt($request->contrasena),
            $rol[0]->nombre_rol
        ]);

        return redirect('/empleados')->with('success', 'Empleado registrado con procedimiento');
    }

    public function show($id)
    {
        $empleado = DB::select("
            SELECT e.*, r.nombre_rol
            FROM EMPLEADO e
            INNER JOIN ROL r ON e.id_rol = r.id_rol
            WHERE e.id_empleado = ?
        ", [$id]);

        if (empty($empleado)) {
            abort(404, 'Empleado no encontrado');
        }

        return view('empleados.show', ['empleado' => $empleado[0]]);
    }

    public function edit($id)
    {
        $empleado = DB::select("SELECT * FROM EMPLEADO WHERE id_empleado = ?", [$id]);
        $roles = DB::select("SELECT * FROM ROL");

        if (empty($empleado)) {
            abort(404, 'Empleado no encontrado');
        }

        return view('empleados.edit', ['empleado' => $empleado[0], 'roles' => $roles]);
    }

    public function update(Request $request, $id)
    {
        DB::statement("CALL ACTUALIZAR_EMPLEADO(?, ?, ?, ?, ?, ?, ?, ?, ?)", [
            $id,
            $request->tipo_documento,
            $request->dni_empleado,
            $request->nombre,
            $request->direccion,
            $request->telefono,
            $request->usuario,
            bcrypt($request->contrasena),
            $request->id_rol
        ]);

        return redirect('/empleados')->with('success', 'Empleado actualizado con procedimiento');
    }

    public function destroy($id)
    {
        DB::statement("DELETE FROM EMPLEADO WHERE id_empleado = ?", [$id]);
        return redirect('/empleados')->with('success', 'Empleado eliminado');
    }
}
