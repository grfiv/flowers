SELECT *
        FROM flowers
        NATURAL JOIN height
        NATURAL JOIN moisture
        NATURAL JOIN categories
        NATURAL JOIN sun
		NATURAL JOIN soil
        NATURAL JOIN deer
        NATURAL JOIN bloom
		NATURAL JOIN photo_credits
	    NATURAL JOIN wildlife
        WHERE image_name != '';
