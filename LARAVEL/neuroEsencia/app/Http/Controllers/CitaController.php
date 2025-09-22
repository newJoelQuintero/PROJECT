<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CitaController extends Controller
{
    public function index()
{
   $citas = \DB::table('CITA')
    ->join('PACIENTE', 'CITA.id_paciente', '=', 'PACIENTE.id_paciente')
    ->select('CITA.*', 'PACIENTE.nombre as nombre_paciente')
    ->get();

    return view('citas.index', compact('citas'));
}

    public function create()
    {
        return view('citas.create');
    }

    public function store(Request $request)
    {

        $codigo = DB::selectOne("CALL PROCEDIMIENTO_INSERTAR_CITA(?, ?, ?, ?)", [
            $request->hora_cita,
            $request->lugar_cita,
            $request->valor_cita,
            $request->dni_cliente
        ]);

        return view('citas.confirmacion', ['codigo' => $codigo->codigo_cita]);
    }

    public function edit($id)
    {
        $cita = DB::select("SELECT * FROM CITA WHERE id_cita = ?", [$id]);
        return view('citas.edit', ['cita' => $cita[0]]);
    }

    public function update(Request $request, $id)
    {
        DB::statement("CALL ACTUALIZAR_CITA(?, ?, ?, ?, ?)", [
            $id,
            $request->hora_cita,
            $request->lugar_cita,
            $request->valor_cita,
            $request->dni_cliente
        ]);

        return redirect('/citas')->with('success', 'Cita actualizada con procedimiento');
    }

    public function destroy($id)
    {
        DB::statement("DELETE FROM CITA WHERE id_cita = ?", [$id]);
        return redirect('/citas')->with('success', 'Cita eliminada');
    }
}
