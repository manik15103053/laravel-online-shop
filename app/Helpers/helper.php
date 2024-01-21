<?php

use App\Models\Category;

function getCategory() {
    return Category::where('show_home', 'Yes')->orderBy('id', 'desc')->get();
}

?>
