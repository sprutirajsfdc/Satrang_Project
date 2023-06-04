@isTest
public class AccountRollupHelper_Test {
    @isTest
    static void dogetmethod(){
        Account acc = new Account();
        acc.Name='Lic';
        insert acc;
        Contact con = new Contact();
        con.LastName='kumar';
        con.AccountId=acc.id;
        insert con;
        
        Policies__c policy1 = new Policies__c();
        policy1.Account__c=acc.id;
        policy1.Contact_Insured__c=con.id;
        policy1.Name='Bima';
        policy1.Status__c='Active';
        insert policy1;
        Policies__c policy2 = new Policies__c();
        policy2.Account__c=acc.id;
        policy2.Contact_Insured__c=con.id;
        policy2.Name='plan';
        policy2.Status__c='InActive';
        insert policy2;
        Policies__c policy3 = new Policies__c();
        policy3.Account__c=acc.id;
        policy3.Contact_Insured__c=con.id;
        policy3.Name='dcvratna';
        policy3.Status__c='Active';
        insert policy3;
        
        List<Policies__c> policies = new List<Policies__c>{ policy1, policy2, policy3};
            Test.startTest();
        AccountRollupHelper.updateAccountRollup(policies);
        Test.stopTest();
        
        
    }
}