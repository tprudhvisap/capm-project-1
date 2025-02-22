namespace com.sap.learning;
using { cuid, managed, Country, Currency, sap.common.CodeList } from '@sap/cds/common';

entity Books: cuid, managed {
        author      : Association to Authors @mandatory;
        title       : localized String(255) @mandatory @assert.target;
        genre       : Genre @assert.range: true;
        publCountry : Country;
        stock       : NoOfBooks default 0;
        price       : Price;
        isHardCover : Boolean;
}

type NoOfBooks : Integer;

entity Authors: cuid, managed {
        books       : Association to many Books on books.author=$self;  
        name        : String(100) @mandatory;
        epoch       : Association to Epochs;
        dateOfBirth : Date;
        dateOfDeath : Date;
}

entity Epochs: CodeList {
    key ID : Integer;
}

type Price {
    amount   : Decimal(10, 2);
    currency : Currency;
}

type Genre     : Integer enum {
    fiction     = 1;
    non_fiction = 2;
}

annotate Books with{
    modifiedAt @odata.etag
}

annotate Authors with{
    modifiedAt @odata.etag
}
