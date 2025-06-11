public class AccountOperations {
    
    /**
    * @description Sets a default description for a list of Account records
    * @param accounts List of Account records to process
    * @return List<Account> The processed Account records
    */
    public static List<Account> setDefaultDescription(List<Account> accounts) {
        try {
            // Process list of accounts instead of single record for bulk operations
            for(Account acct : accounts) {
                if(acct != null) {
                    acct.Description = 'Default description';
                }
            }
            
            // Log successful operation
            Logger.info('Successfully set default description for ' + accounts.size() + ' accounts');
            Logger.saveLog();
            
            return accounts;
            
        } catch(Exception e) {
            // Log error using Nebula Logger framework
            Logger.error('Error setting default description for accounts: ' + e.getMessage());
            Logger.saveLog();
            throw e;
        }
    }
}
