<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    protected $table = 'empleado';
    protected $primaryKey = 'id_empleado';
    public $timestamps = false;

    protected $fillable = [
        'tipo_documento',
        'dni_empleado',
        'nombre',
        'direccion',
        'telefono',
        'usuario',
        'contrasena',
        'id_rol'
    ];
}
