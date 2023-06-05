/*
    @Description        : "Implement a search functionality on this platform, allowing users to search for content by its title."
    @Author             : Sprutiraj
    @Last Modified By   : Sprutiraj
    @Last Modified On   : 04-06-2023
    @Modification Log   :
    Ver       Date            Author          Modification
    1.0    05-06-2023       Sprutiraj        Initial Version
*/
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