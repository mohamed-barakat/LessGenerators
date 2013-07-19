LoadPackage( "LessGenerators" );

Q := HomalgFieldOfRationalsInSingular( );

R := ( Q * "x,y,z" ) * "t";

AssignGeneratorVariables( R );

row := HomalgMatrix( "[ 2*t*x*z+t*y^2+1, 2*t*x*y+t^2, t*x^2 ]", 1, 3, R );

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