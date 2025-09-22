<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FacturaVenta extends Model
{
    protected $table = 'factura_venta';
    protected $primaryKey = 'id_factura';
    public $timestamps = false;

    protected $fillable = [
        'tipo_metodo_pago',
        'total_factura',
        'id_empleado',
        'id_paciente'
    ];
}
