public class AccountOperations {
    public static Account setDefaultDescription(Account a) {
        a.Description = 'Default description';
        return a;
        // Jan 21 Update Now Again
    }

    // Add default billing address
    public static Account setDefaultBillingAddress(Account a) {
        a.BillingStreet = '123 Default Street';
        a.BillingCity = 'San Francisco';
        a.BillingState = 'CA';
        a.BillingPostalCode = '94105';
        return a;
    }

    // Add default phone number
    public static Account setDefaultPhone(Account a) {
        a.Phone = '(555) 555-0123';
        return a;
    }

    // Set default website URL 
    public static Account setDefaultURL(Account a) {
        a.Website = 'www.example.com';
        return a;
    }

    // Check if account is complete
    public static Boolean isAccountComplete(Account a) {
        return !String.isBlank(a.Name) 
            && !String.isBlank(a.Phone)
            && !String.isBlank(a.BillingStreet);
    }
}