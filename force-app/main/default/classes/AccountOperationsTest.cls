@IsTest
private class AccountOperationsTest {
    @isTest static void setDefaultDescription() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountOperations.setDefaultDescription(acc);
        System.assertEquals('Default description', acc.Description);
    }
    
    @isTest static void setDefaultBillingAddress() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountOperations.setDefaultBillingAddress(acc);
        System.assertEquals('123 Default Street', acc.BillingStreet);
        System.assertEquals('San Francisco', acc.BillingCity);
        System.assertEquals('CA', acc.BillingState);
        System.assertEquals('94105', acc.BillingPostalCode);
    }
    
    @isTest static void setDefaultPhone() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountOperations.setDefaultPhone(acc);
        System.assertEquals('(555) 555-0123', acc.Phone);
    }
    
    @isTest static void setDefaultURL() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountOperations.setDefaultURL(acc);
        System.assertEquals('www.example.com', acc.Website);
    }
    
    @isTest static void testIsAccountComplete() {
        // Test incomplete account
        Account incompleteAcc = new Account(Name = 'Test Account');
        System.assertEquals(false, AccountOperations.isAccountComplete(incompleteAcc));
        
        // Test complete account
        Account completeAcc = new Account(
            Name = 'Test Account',
            Phone = '(555) 555-0123',
            BillingStreet = '123 Default Street'
        );
        System.assertEquals(true, AccountOperations.isAccountComplete(completeAcc));
    }
}