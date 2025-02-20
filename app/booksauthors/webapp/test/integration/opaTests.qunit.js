sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'books/booksauthors/test/integration/FirstJourney',
		'books/booksauthors/test/integration/pages/BooksList',
		'books/booksauthors/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('books/booksauthors') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);