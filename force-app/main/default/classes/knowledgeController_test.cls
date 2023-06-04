@isTest
public class knowledgeController_test {
    @isTest
    static void dotest(){
        Knowledge__kav kn = new Knowledge__kav();
        kn.Title='salesforce';
        kn.UrlName='salesforce';
        kn.Answer__c='saas platform';
        insert kn;
        test.startTest();
        knowledgeController.getarticle();
        test.stopTest();
    }
    @istest 
    static void dostest2(){
        Knowledge__kav know = new Knowledge__kav();
        know.Title='salesforce';
        know.UrlName='salesforce';
        know.Answer__c='saas platform';
        insert know;
        
        test.startTest();
        List<Knowledge__kav> result = knowledgeController.Findgetarticle('salesforce');
        test.stopTest();
    }
    
}