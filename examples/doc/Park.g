LoadPackage( "LessGenerators" );

Q := HomalgFieldOfRationalsInSingular( );

R := ( Q * "x,y" ) * "z";

AssignGeneratorVariables( R );

f1 := 1-x*y-2*z-4*x*z-x^2*z-2*x*y*z+2*x^2*y^2*z-2*x*z^2-2*x*z^2-2*x^2*z^2+2*x*z^2+2*x^2*y*z^2;
f2 := 2+4*x+x^2+2*x*y-2*x^2*y^2+2*x*z+2*x^2*z-2*x^2*y*z;
f3 := 1+2*x+x*y-x^2*y^2+x*z+x^2*z-x^2*y*z;
f4 := 2+x+y-x*y^2+z-x*y*z;

row := HomalgMatrix( [ f1, f2, f3, f4 ], 1, 4, R );

Assert( 0, IsRightInvertibleMatrix( row ) );

m1 := AMaximalIdealContaining( ZeroLeftSubmodule( BaseRing( R ) ) );

m1 := EntriesOfHomalgMatrix( MatrixOfSubobjectGenerators( m1 ) );

S1 := LocalizeBaseRingAtPrime( R, m1 );

row1 := S1 * row;

Assert( 0, IsRightInvertibleMatrix( row1 ) );
                                                                                                 
H1 := Horrocks( row1, 2 );

Delta1 := Denominator( H1[1] ) / BaseRing( R );

m2 := AMaximalIdealContaining( LeftSubmodule( [ Delta1 ] ) );

m2 := EntriesOfHomalgMatrix( MatrixOfSubobjectGenerators( m2 ) );

S2 := LocalizeBaseRingAtPrime( R, m2 );

Assert( 0, IsIdenticalObj( AssociatedComputationRing( S1 ), AssociatedComputationRing( S2 ) ) );

row2 := S2 * row;

Assert( 0, IsRightInvertibleMatrix( row2 ) );
                                                                                                 
H2 := Horrocks( row2, 2 );

V := Patch( row, [ H1[1], H2[1] ], [ H1[2], H2[2] ] );

Assert( 0, ForAll( EntriesOfHomalgMatrix( row * V ), e -> Degree( e ) < 1 ) );
