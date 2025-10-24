/**
 * @description Utility class for Account operations following ACME development standards
 * @author [Your Name]
 * @date [Current Date]
 * @version 1.0
 */
public class AccountOperationsUtils {
    
    /**
     * @description Sets default description for a list of Account records
     * @param accountList List of Account records to update
     * @return List<Account> Updated Account records with default descriptions
     */
    public static List<Account> setDefaultDescription(List<Account> accountList) {
        List<Account> updatedAccounts = new List<Account>();
        
        try {
            // Validate input parameter
            if (accountList == null || accountList.isEmpty()) {
                Logger.warn('AccountOperationsUtils.setDefaultDescription: Empty or null account list provided');
                return new List<Account>();
            }
            
            // Process accounts in bulk
            for (Account acc : accountList) {
                if (acc != null) {
                    acc.Description = 'Default description';
                    updatedAccounts.add(acc);
                }
            }
            
            Logger.info('AccountOperationsUtils.setDefaultDescription: Successfully processed ' + 
                       updatedAccounts.size() + ' accounts');
            
        } catch (Exception e) {
            Logger.error('AccountOperationsUtils.setDefaultDescription: Exception occurred', e);
            throw e;
        } finally {
            Logger.saveLog();
        }
        
        return updatedAccounts;
    }
    
    /**
     * @description Sets default description for a single Account record (overloaded method)
     * @param account Single Account record to update
     * @return Account Updated Account record with default description
     */
    public static Account setDefaultDescription(Account account) {
        List<Account> accountList = new List<Account>{account};
        List<Account> processedAccounts = setDefaultDescription(accountList);
        return processedAccounts.isEmpty() ? null : processedAccounts[0];
    }
}