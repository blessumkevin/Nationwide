@IsTest
private class AccountOperations_Test {
    
    @IsTest
    static void testSetDefaultDescription_Success() {
        // Arrange
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < 200; i++) { // Testing bulk scenario
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        
        // Act
        Test.startTest();
        List<Account> processedAccounts = AccountOperations.setDefaultDescription(testAccounts);
        Test.stopTest();
        
        // Assert
        System.assertEquals(200, processedAccounts.size(), 'Should return same number of accounts');
        for(Account acc : processedAccounts) {
            System.assertEquals('Default description', acc.Description, 
                'Account description should be set to default value');
        }
    }
    
    @IsTest
    static void testSetDefaultDescription_NullAccount() {
        // Arrange
        List<Account> testAccounts = new List<Account>{null};
        
        // Act
        Test.startTest();
        List<Account> processedAccounts = AccountOperations.setDefaultDescription(testAccounts);
        Test.stopTest();
        
        // Assert
        System.assertEquals(1, processedAccounts.size(), 'Should return same number of accounts');
        System.assertEquals(null, processedAccounts[0], 'Null account should remain null');
    }
    
    @IsTest
    static void testSetDefaultDescription_EmptyList() {
        // Arrange
        List<Account> testAccounts = new List<Account>();
        
        // Act
        Test.startTest();
        List<Account> processedAccounts = AccountOperations.setDefaultDescription(testAccounts);
        Test.stopTest();
        
        // Assert
        System.assertEquals(0, processedAccounts.size(), 'Should return empty list');
    }
}
