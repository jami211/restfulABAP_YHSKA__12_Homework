CLASS zcl_generate_language_data_012 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_generate_language_data_012 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: itablanguage TYPE TABLE OF zlanguage_012.

    itablanguage = VALUE #(
    ( mykey = '02D5290E594C1EDA93815057FD946624' language_id = 1 name = 'Python' publishing_year = '1991' developed_by = 'Guido van Rossum' documentation_url = 'https://docs.python.org/3/'
    hello_world = 'print("Hello World!")' status = ''  rating = 5 )
    ( mykey = '02D5290E594C1EDA93815C50CD7AE62A' language_id = 2 name = 'TypeScript' publishing_year = '2012' developed_by = 'Anders Hejlsberg' documentation_url = 'https://www.typescriptlang.org/'
    hello_world = 'console.log("Hello World!");' status = '' rating = 5 )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EB07' language_id = 3 name = 'Kotlin' publishing_year = '2011' developed_by = 'JetBrains' documentation_url = 'https://kotlinlang.org/docs/reference/'
    hello_world = 'println("Hello World!")' status = ''  rating = 4 )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EB67' language_id = 4 name = 'Java' publishing_year = '1995' developed_by = 'Sun Microsystems' documentation_url = 'https://docs.oracle.com/en/java/'
    hello_world = 'System.out.println("Hello World!");' status = ''  rating = 2 )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EBD7' language_id = 5 name = 'C' publishing_year = '1972' developed_by = 'Dennis Ritchie' documentation_url = 'https://devdocs.io/c/'
    hello_world = 'printf("Hello World!");' status = '' rating = 3 )
    ( mykey = '02D5290E594C1EDA93858EED2DA4998V' language_id = 6 name = 'C++' publishing_year = '1985' developed_by = 'Bjarne Stroustrup' documentation_url = 'https://devdocs.io/cpp/'
    hello_world = 'cout << "Hello World!" << std::endl;' status = '' rating = 3 )
    ( mykey = '02D5290E594C1EDA93858EED2DA124V' language_id = 7 name = 'Swift' publishing_year = '2014' developed_by = 'Apple Inc.' documentation_url = 'https://swift.org/documentation/'
hello_world = 'print("Hello World!")' status = '' rating = 4 )
( mykey = '02D5290E594C1EDA93858EED2DA56DV' language_id = 8 name = 'ABAP' publishing_year = '1983' developed_by = 'SAP SE' documentation_url = 'https://help.sap.com/doc/abapdocu_750_index_htm/7.50/de-DE/index.htm'
hello_world = '''WRITE Hello World!'' ' status = '' rating = 5 )
( mykey = '02D5290E594C1EDA93858EED2DABB1B' language_id = 9 name = 'JavaScript' publishing_year = '1995' developed_by = 'Brendan Eich' documentation_url = 'https://www.w3schools.com/js/default.asp'
hello_world = 'console.log("Hello World!");' status = '' rating = 3 )
( mykey = '02D5290E594C1EDA93858EED2DA56DB' language_id = 10 name = 'Rust' publishing_year = '2010' developed_by = 'Rust Project Developers' documentation_url = 'https://www.rust-lang.org/learn'
hello_world = 'println!("Hello World!");' status = '' rating = 3 )
( mykey = '02D5290E594C1EDA93858EED2DA789B' language_id = 11 name = 'CoffeeScript' publishing_year = '2009' developed_by = 'Jeremy Ashkenas' documentation_url = 'https://coffeescript.org/'
hello_world = 'alert "Hello World!"' status = '' rating = 2 )
( mykey = '02D5290E594C1EDA93858EED2DA14P9' language_id = 12 name = 'Scala' publishing_year = '2001' developed_by = 'École polytechnique fédérale de Lausanne' documentation_url = 'https://docs.scala-lang.org/'
hello_world = 'alert "Hello World!"' status = '' rating = 3 )
( mykey = '02D5290E594C1EDA93858EED2DA19JG' language_id = 13 name = 'Crystal' publishing_year = '2014' developed_by = 'Manas Technology Solutions' documentation_url = 'https://crystal-lang.org/'
hello_world = 'puts "Hello World"' status = '' rating = 4 )
( mykey = '02D5290E594C1EDA93858EED2DA780H' language_id = 14 name = 'Go' publishing_year = '2009' developed_by = 'Robert Griesemer, Rob Pike, Ken Thompson' documentation_url = 'https://godoc.org/'
hello_world = 'fmt.Println("Hello World!")' status = '' rating = 2 )
( mykey = '02D5290E594C1EDA93858EED2DADI9Z' language_id = 15 name = 'Perl' publishing_year = '1987' developed_by = 'Larry Wall, Perl Porter' documentation_url = 'https://perldoc.perl.org/'
hello_world = 'print "Hello World!";' status = '' rating = 3 )
( mykey = '02D5290E594C1EDA93858EED2DA1IU8' language_id = 16 name = 'Pascal' publishing_year = '1971' developed_by = 'Niklaus Wirth' documentation_url = 'https://wiki.freepascal.org/Lazarus_Documentation/de'
hello_world = 'writeln (''Hello World!'')' status = '' rating = 3 )
( mykey = '02D5290E594C1EDA93858EED2DAS3SF' language_id = 17 name = 'PHP' publishing_year = '1995' developed_by = 'Rasmus Lerdorf' documentation_url = 'https://www.php.net/docs.php'
hello_world = 'echo ''Hallo Welt!'';' status = '' rating = 2 )
( mykey = '02D5290E594C1EDA93858EED2DA8G7F' language_id = 18 name = 'C#' publishing_year = '2001' developed_by = 'Microsoft' documentation_url = 'https://docs.microsoft.com/de-de/dotnet/csharp/'
hello_world = 'Console.WriteLine("Hello World!");' status = '' rating = 2 )
( mykey = '02D5290E594C1EDA93858EED2DA258F' language_id = 19 name = 'Ruby' publishing_year = '1995' developed_by = 'Yukihiro Matsumoto' documentation_url = 'https://www.ruby-lang.org/de/'
 hello_world = 'puts ''Hello World!''' status = '' rating = 2 )
( mykey = '02D5290E594C1EDA93858EED2DA9U00' language_id = 20 name = 'Haskell' publishing_year = '1990' developed_by = 'Simon Peyton Jones, Paul Hudak, Philip Wadler' documentation_url = 'https://www.haskell.org/'
hello_world = 'NSLog(@"Hello, World!");' status = '' rating = 1 )
( mykey = '02D5290E594C1EDA93858EED2DO90LO' language_id = 21 name = 'Visual Basic .NET' publishing_year = '2002' developed_by = 'Microsoft' documentation_url = 'https://docs.microsoft.com/de-de/dotnet/visual-basic/'
hello_world = 'System.Console.WriteLine("Hello World!")' status = '' rating = 2 )
( mykey = '02D5290E594C1EDA03858EED2DPO89N' language_id = 22 name = 'Dart' publishing_year = '2013' developed_by = 'Lars Bak, Google LLC' documentation_url = 'https://dart.dev/'
hello_world = 'print(''Hello, World!'');' status = '' rating = 5 )
( mykey = '02D52955594C1EDA93858EED2DAGH6R' language_id = 23 name = 'R' publishing_year = '1993' developed_by = 'Ross Ihaka, Robert Gentleman' documentation_url = 'https://dart.dev/'
hello_world = 'writeLines("Hello World!")' status = '' rating = 2 )
( mykey = '02D5290E594C1EDA938582EUZ754FR6' language_id = 24 name = 'Fortran' publishing_year = '1957' developed_by = 'John Backus, IBM' documentation_url = 'http://www.fortran.de/'
hello_world = 'print *, "Hello World!"' status = '' rating = 1 )
( mykey = '02D5290E5912345A93858EED2DAZ6PA' language_id = 25 name = 'Elm' publishing_year = '2012' developed_by = 'Evan Czaplicki' documentation_url = 'https://elm-lang.org/docs'
hello_world = 'text "Hello World!"' status = '' rating = 4 )
( mykey = '02D5AAAE594C1EDA93AAAEED2DAR5XA' language_id = 26 name = 'Erlang' publishing_year = '1987' developed_by = 'Ericsson' documentation_url = 'https://erlang.org/doc/search/'
hello_world = 'io:fwrite("hello World!").' status = '' rating = 1 )
( mykey = '0212390E594C1EDJKL958EED228123A' language_id = 27 name = 'Squirrel' publishing_year = '2003' developed_by = 'Alberto Demichelis' documentation_url = 'http://squirrel-lang.org/'
hello_world = '::print("Hello World!");' status = '' rating = 3 )
( mykey = '02D51238904C1EDA93858EED2DAA2CA' language_id = 28 name = 'Pharo' publishing_year = '2008' developed_by = 'Pharo Community' documentation_url = 'https://pharo.org/'
hello_world = 'Transcript show: ''Hello World''' status = '' rating = 3 )
( mykey = '02D5291G2J3C1EDA93858EE1278PO9A' language_id = 29 name = 'Julia' publishing_year = '2012' developed_by = 'Jeff Bezanson, Stefan Karpinski, Viral B. Shah' documentation_url = 'https://julialang.org/'
hello_world = 'println("hello world")' status = '' rating = 4 )
( mykey = '02GG290E594S2EDA93858EED2DAH86A' language_id = 30 name = 'Ada' publishing_year = '1980' developed_by = 'Jean Ichbiah' documentation_url = 'https://www.adaic.org/'
hello_world = 'Put_Line("Hello world!");' status = '' rating = 3 )
( mykey = '02D5290E594C1EHH83858EED2DAH45A' language_id = 31 name = 'Objective-C' publishing_year = '1984' developed_by = 'Tom Love, Brad Cox' documentation_url = 'https://en.wikibooks.org/wiki/Objective-C_Programming'
hello_world = 'NSLog(@"Hello, World!");' status = '' rating = 2 )
     ).

*   delete existing entries in the database table
    DELETE FROM zlanguage_012.

*   insert the new table entries
    INSERT zlanguage_012 FROM TABLE @itablanguage.

*   check the result
    SELECT * FROM zlanguage_012 INTO TABLE @itablanguage.
    out->write( sy-dbcnt ).
    out->write( 'Language data inserted successfully!').
  ENDMETHOD.
ENDCLASS.
