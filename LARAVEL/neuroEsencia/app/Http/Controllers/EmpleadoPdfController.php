<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Empleado;
use FPDF;

class EmpleadoPdfController extends Controller
{
    public function generarPDF()
    {
        $empleados = Empleado::all();

        $pdf = new FPDF();
        $pdf->AddPage();
        $pdf->SetFont('Arial','B',16);

        // Título
        $pdf->Cell(0,10,utf8_decode('Lista de Empleados'),0,1,'C');
        $pdf->Ln(5);

        // Encabezados de la tabla
        $pdf->SetFont('Arial','B',10);
        $pdf->Cell(20,10,'ID',1,0,'C');
        $pdf->Cell(30,10,'Documento',1,0,'C');
        $pdf->Cell(40,10,'Nombre',1,0,'C');
        $pdf->Cell(30,10,'Telefono',1,0,'C');
        $pdf->Cell(30,10,'Usuario',1,0,'C');
        $pdf->Cell(30,10,'Rol',1,1,'C');

        // Filas con datos
        $pdf->SetFont('Arial','',9);
        foreach ($empleados as $empleado) {
            $pdf->Cell(20,8,$empleado->id_empleado,1,0,'C');
            $pdf->Cell(30,8,$empleado->dni_empleado,1,0,'C');
            $pdf->Cell(40,8,utf8_decode($empleado->nombre),1,0,'C');
            $pdf->Cell(30,8,$empleado->telefono,1,0,'C');
            $pdf->Cell(30,8,$empleado->usuario,1,0,'C');
            $pdf->Cell(30,8,$empleado->nombre_rol,1,1,'C');
        }

        // Descargar
        $pdf->Output('I','Empleados.pdf');
        exit;
    }
    public function show($id)
{
    $empleado = \App\Models\Empleado::findOrFail($id);

    return view('empleados.show', compact('empleado'));
}
}
