<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Article extends Model
{
    public $timestamps = false;
    protected $primaryKey = 'ID';
    public $incrementing = true;
    use HasFactory;

    public function user()
    {
        return $this->belongsTo(User::class);
    }


}
