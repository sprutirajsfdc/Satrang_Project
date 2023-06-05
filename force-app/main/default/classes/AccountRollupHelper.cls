/*
    @Description        : "Implements Roll-Up trigger to Count the No of Insured & No of Active* Policies "
    @Author             : Sprutiraj
    @Last Modified By   : Sprutiraj
    @Last Modified On   : 03-06-2023
    @Modification Log   :
    Ver       Date            Author          Modification
    1.0    04-06-2023       Sprutiraj        Initial Version
*/
public class AccountRollupHelper {
    public static void updateAccountRollup(List<Policies__c> policies) {
        // Create a set to store the Account IDs
        Set<Id> accountIds = new Set<Id>();
        system.debug('Account Id>>>>>'+accountIds);
        // Iterate through the Policies__c records and add the Account IDs to the set
        for (Policies__c policy : policies) {
            accountIds.add(policy.Account__c);
        }
         // Query the related Accounts with their child Policies__c records
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, (SELECT Id, Status__c, Contact_Insured__c FROM Policies__r) FROM Account WHERE Id IN :accountIds]);
        system.debug('Map of account>>>>>'+accountMap);
        // Create a list to store the updated Account records
        List<Account> accountsToUpdate = new List<Account>();
        for (Account account : accountMap.values()) {
            Integer insuredCount = 0;
            Integer activePolicyCount = 0;
            // Iterate through the child Policies__c records of each Account
            for (Policies__c policy : account.Policies__r) {
                insuredCount++;
                // Check if the policy is active based on the Status__c field value
                if (policy.Status__c != null && policy.Status__c.equalsIgnoreCase('Active')) {
                    activePolicyCount++;
                }
            }
            // Update the No_of_Insured__c and No_of_Active_Policies__c fields on the Account
            account.No_of_Insured__c = insuredCount;
            account.No_of_Active_Policies__c = activePolicyCount;
             // Add the updated Account record to the list
            accountsToUpdate.add(account);
        }
         // Check if there are any updated Account records to be updated
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}