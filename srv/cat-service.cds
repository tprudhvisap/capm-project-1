using com.sap.learning as db from '../db/schema';

service CatalogService @(path: '/CatalogService') {

    entity Authors as projection on db.Authors{
        *,
        epoch.name as period
    }excluding{
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity Books as projection on db.Books{
        ID,
        title,
        author.name         as writer,
        publCountry.name    as publCountry,
        isHardCover,
        price.amount,
        price.currency,
        stock,
        author 
    };

}