namespace com.sap.learning;
using { cuid, managed, Country, Currency } from '@sap/cds/common';

entity Books: cuid, managed {
        author      : Association to Authors;
        title       : localized String(255);
        genre       : Genre;
        publCountry : Country;
        stock       : NoOfBooks;
        price       : Price;
        isHardCover : Boolean;
}

type NoOfBooks : Integer;

entity Authors: cuid, managed {
        books       : Association to many Books on books.author=$self;  
        name        : String(100);
        dateOfBirth : Date;
        dateOfDeath : Date;
};

type Price {
    amount   : Decimal(10, 2);
    currency : Currency;
}

type Genre     : Integer enum {
    fiction     = 1;
    non_fiction = 2;
}
