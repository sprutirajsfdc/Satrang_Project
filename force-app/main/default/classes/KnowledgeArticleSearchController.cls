public with sharing class KnowledgeArticleSearchController {
    
    @AuraEnabled(Cacheable = true)
    public static List<Knowledge__kav> getknowledgeData(String textkey) {
        textkey = '%' + textkey + '%';
        List<Knowledge__kav> knowLst = [
            SELECT Title, Summary, Id, Question__c, Answer__c, Environment__c, Content__c, Internal_Resolution__c
            FROM Knowledge__kav
            WHERE Title LIKE :textkey
        ];
        
        if (knowLst.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        
        return knowLst; 
    }
}