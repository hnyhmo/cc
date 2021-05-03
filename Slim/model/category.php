<?php

use \Illuminate\Database\Eloquent\Model;

class Category extends Model
{

    protected $fillable = [
        'title',
        'parent_id',
        'active',
        'show_child'
      ];

      
    public function child(){
        return $this->hasMany(Category::class,'parent_id')->with('child');
    }

    protected $table = 'categories';


}