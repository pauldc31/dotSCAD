module fail(message) {
    echo(
        str( 
            "<b>",
                "<span style='color: red'>", 
                    "FAIL", 
                "</span>", 
            "</b>"
        )
    );
    if(message != undef) {
        echo(
            str( 
                "<b>",
                    "<span style='color: red'>　",
                        message, 
                    "</span>", 
                "</b>"
            )
        );
    }
}

module assertEqualPoint(expected, actual) {
    n = 1000;

    function truncate_float_point(number) =
        number >= 0 ? floor(number) : ceil(number);

    function shift_to_int(pt, n) = 
        len(pt) == 2 ? 
            [truncate_float_point(pt[0] * n), truncate_float_point(pt[1] * n)] :
            [truncate_float_point(pt[0] * n), truncate_float_point(pt[1] * n), truncate_float_point(pt[2] * n)];
    
    shifted_expected = shift_to_int(
        expected, 
        n
    );    

    shifted_actual = shift_to_int(
        actual, 
        n
    );
    
    if(shifted_expected != shifted_actual) {
        fail(
            str("expected: ", shifted_expected,
            ", but: ", shifted_actual)
        );
    }
}

module assertEqualPoints(expected, actual) {
    for(i = [0:len(actual) - 1]) {        
        assertEqualPoint(expected[i], actual[i]);
    }
}