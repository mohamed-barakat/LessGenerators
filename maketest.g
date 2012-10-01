## This file is automatically generated
## Standard maketest.g for the homalg project

LoadPackage( "LessGenerators" );
LoadPackage( "IO_ForHomalg" );
HOMALG_IO.show_banners := false;
HOMALG_IO.use_common_stream := true;
Read( "ListOfDocFiles.g" );
example_tree := ExtractExamples( DirectoriesPackageLibrary( "LessGenerators", "doc" )[1]![1], "LessGenerators.xml", list, 500 );
RunExamples( example_tree, rec( compareFunction := "uptowhitespace" ) );
GAPDocManualLab( "LessGenerators" );
QUIT;
