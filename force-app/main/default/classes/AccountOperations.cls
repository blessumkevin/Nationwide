public class AccountOperations {
    public static Account setDefaultDescription(Account a) {
        // test
        a.Description = 'Default description';
        return a;
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
