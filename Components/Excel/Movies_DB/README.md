File: "movies_db_uncleaned.xlsx"
    COl: "Studio"

        Replace null with "Not Avaliable".   
        Step1: After selecting entire col, Ctrl+H --> put replace text --> Replace All.

        Replace trailing and leading spaces.
        Step1: On a new col used trim() and select Studio col's first value as input. Then "ctrl+alt+v" on "Studio" col to paste value only not formula too.

    COL: "movie_id_title"

        Identify Duplicates. 
        Step1: Home --> Conditional Formatting --> Highlight Cells Rules --> Duplicate values.

        Remove Duplicates.
        Step1:  Data--> Remove Duplicates --> select "movie_id_title" after deselecting other cols.

        Split movie id and title.
        Step1: Create 2 cols after "movie_id_title", for the newly creating columns.
        Step2: Data --> Text to columns --> Fixed width --> mark 2 lines before and after ":", if change columns types and Finish.
        Step3: Remove Col 2 which will be ":" and rename other two columns. 

    COL: "Budget","revenue","Unit","Currency"

        Fetch "financials" table To "Movies" table one by one.
        Step1: Use VLOOKUP function to fetch data from one table to another using a Unique Col.
               =VLOOKUP(
                Movies[@[movie_id]:[movie_id]], ==> from Movies table Movie_id is selected as our unique field.":[movie_id]" this syntax is for locking the column
                Financials[#All], ==> entire Financials table selected.
                2, => from Financials fetch 2nd column which is "Budget". its the col which we need to fetch to Movies table initially.
                FALSE ==> False for exact match
                )
        Note : here movie_id is the unique field we have to mention in Movies table, but in Financials table Excel will automatically consider first col as Movie_id, so dont change col in Financials table.


    

