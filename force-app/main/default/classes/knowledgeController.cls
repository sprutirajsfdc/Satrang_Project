public  class knowledgeController {
    @AuraEnabled
    public static List<Knowledge__kav> getarticle(){       
        
        List<Knowledge__kav> article  = 
            [SELECT Title, Summary, Id, Question__c, Answer__c, Environment__c, Content__c, Internal_Resolution__c From Knowledge__kav];
        return article;
    }
    @AuraEnabled
    public static List<Knowledge__kav >Findgetarticle(String searchKey){
        String TitleType = '%' + searchKey + '%';
        return [SELECT Title, Summary, Id, Question__c, Answer__c, Environment__c, Content__c, Internal_Resolution__c from Knowledge__kav WHERE Title LIKE :TitleType];
    }
}