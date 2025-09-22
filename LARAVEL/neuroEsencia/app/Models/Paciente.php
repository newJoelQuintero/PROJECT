<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Paciente extends Model
{
    protected $table = 'paciente';
    protected $primaryKey = 'id_paciente';
    public $timestamps = false;

    protected $fillable = [
        'tipo_documento',
        'dni_cliente',
        'nombre',
        'direccion',
        'telefono',
        'usuario',
        'contrasena'
    ];
}
