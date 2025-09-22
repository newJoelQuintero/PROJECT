<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FacturaVentaController extends Controller

{
    public function index()
    {
        $facturas = DB::select("
            SELECT f.id_factura, f.tipo_metodo_pago, f.total_factura,
                e.nombre AS nombre_empleado,
                p.nombre AS nombre_paciente
            FROM FACTURA_VENTA f
            INNER JOIN EMPLEADO e ON f.id_empleado = e.id_empleado
            INNER JOIN PACIENTE p ON f.id_paciente = p.id_paciente
        ");

        return view('facturas.index', compact('facturas'));
    }

    public function create()
    {
        return view('facturas.create');
    }

    public function store(Request $request)
    {
        DB::statement("CALL PROCEDIMIENTO_INSERTAR_FACTURA(?, ?, ?, ?)", [
            $request->tipo_metodo_pago,
            $request->total_factura,
            $request->dni_empleado,
            $request->dni_cliente
        ]);

        return redirect('/facturas')->with('success', 'Factura registrada con procedimiento');
    }

    public function edit($id)
    {
        $factura = DB::select("SELECT * FROM FACTURA_VENTA WHERE id_factura = ?", [$id]);
        return view('facturas.edit', ['factura' => $factura[0]]);
    }

    public function update(Request $request, $id)
    {
        DB::statement("CALL ACTUALIZAR_FACTURA(?, ?, ?, ?, ?)", [
            $id,
            $request->tipo_metodo_pago,
            $request->total_factura,
            $request->id_empleado,
            $request->id_paciente
        ]);

        return redirect('/facturas')->with('success', 'Factura actualizada con procedimiento');
    }

    public function destroy($id)
    {
        DB::statement("DELETE FROM FACTURA_VENTA WHERE id_factura = ?", [$id]);
        return redirect('/facturas')->with('success', 'Factura eliminada');
    }
}
