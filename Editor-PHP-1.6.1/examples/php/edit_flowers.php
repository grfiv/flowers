<?php

/*
 * Example PHP implementation used for the index.html example
 */

// DataTables PHP library
include( "../../php/DataTables.php" );

// Alias Editor classes so they are easy to use
use
	DataTables\Editor,
	DataTables\Editor\Field,
	DataTables\Editor\Format,
	DataTables\Editor\Mjoin,
	DataTables\Editor\Options,
	DataTables\Editor\Upload,
	DataTables\Editor\Validate;

// Build our Editor instance and process the data coming from _POST
Editor::inst( $db, 'flowers' )
    ->fields(

        Field::inst( 'latin' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'common' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'image_name' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'height_code' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'bloom_code' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'sun_code' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'moist_code' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'cat_code' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'deer_code' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'wild_code' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'soil_code' )->validator( 'Validate::notEmpty' ),
        Field::inst( 'wildlife_comments' ),
        Field::inst( 'design_function' ),
        Field::inst( 'gardening_tips' ),
        Field::inst( 'credit_code' )->validator( 'Validate::notEmpty' )
    )
	->process( $_POST )
	->json();
