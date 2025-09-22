<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PacienteController extends Controller
{
    public function index()
    {
        $pacientes = DB::select("SELECT * FROM PACIENTE");
        return view('pacientes.index', compact('pacientes'));
    }

    public function create()
    {
        return view('pacientes.create');
    }

    public function store(Request $request)
    {
        DB::statement("CALL PROCEDIMIENTO_INSERTAR_PACIENTE(?, ?, ?, ?, ?, ?, ?)", [
            $request->tipo_documento,
            $request->dni_cliente,
            $request->nombre,
            $request->direccion,
            $request->telefono,
            $request->usuario,
            bcrypt($request->contrasena)
        ]);

        return redirect('/pacientes')->with('success', 'Paciente registrado con procedimiento');
    }

    public function edit($id)
    {
        $paciente = DB::select("SELECT * FROM PACIENTE WHERE id_paciente = ?", [$id]);
        return view('pacientes.edit', ['paciente' => $paciente[0]]);
    }

    public function update(Request $request, $id)
    {
        DB::statement("CALL ACTUALIZAR_PACIENTE(?, ?, ?, ?, ?, ?, ?, ?)", [
            $id,
            $request->tipo_documento,
            $request->dni_cliente,
            $request->nombre,
            $request->direccion,
            $request->telefono,
            $request->usuario,
            bcrypt($request->contrasena)
        ]);

        return redirect('/pacientes')->with('success', 'Paciente actualizado con procedimiento');
    }

    public function destroy($id)
    {
        DB::statement("DELETE FROM PACIENTE WHERE id_paciente = ?", [$id]);
        return redirect('/pacientes')->with('success', 'Paciente eliminado');
    }
}
