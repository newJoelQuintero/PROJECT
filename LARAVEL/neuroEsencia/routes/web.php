<?php

use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\PacienteController;
use App\Http\Controllers\FacturaVentaController;
use App\Http\Controllers\CitaController;
use App\Http\Controllers\EmpleadoPdfController;

Route::resource('empleados', EmpleadoController::class);
Route::resource('pacientes', PacienteController::class);
Route::resource('facturas', FacturaVentaController::class);
Route::resource('citas', CitaController::class);
Route::get('/empleados/pdf', [EmpleadoPdfController::class, 'generarPDF'])->name('empleados.pdf');



