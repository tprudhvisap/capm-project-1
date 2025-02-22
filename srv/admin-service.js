const cds = require('@sap/cds');

class AdminServices extends cds.ApplicationService{
    init() {
        const { Authors }   = this.entities; //The destructuring assignment syntax is JavaScript standard. It is a JavaScript expression that makes it possible to unpack values from arrays, or properties from objects, into distinct variables.
        this.before(['CREATE','UPDATE'], Authors, this.validateLifeData);
        return super.init();
    }
    validateLifeData(req){
        const{ dateOfBirth, dateOfDeath } = req.data;
        if (!dateOfBirth || !dateOfDeath) {     // Check for blank dates
            return;
        }
        // Converting String to Date format.
        const birth = new Date(dateOfBirth);
        const death = new Date(dateOfDeath);
        if (death < birth) {
            req.error(`The date of death (${dateOfDeath}) is before the date of Birth (${dateOfBirth}).`);            
        }
    }
}
module.exports = AdminServices;

