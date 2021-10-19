/**
 * Created by zjankowski on 19.10.2021.
 */
@IsTest
public with sharing class WebinarMember_trigger_test {

    @IsTest
    public static void testEnsureCommentForRejected_activeBehavior (){
        Webinar_member__c member = new Webinar_member__c();
        member.Status__c = 'Rejected';

        Boolean errorCaught = false;
        try{insert member;}
        catch(Exception e){
            errorCaught=true;
            System.assert(e.getMessage().contains('Provide a comment for rejected users'),'trigger allows rejected users without comments');
        }
        System.assert(errorCaught);
    }

    @IsTest
    public static void testEnsureCommentForRejected_passiveBehavior (){
        Webinar_member__c member = new Webinar_member__c();
        member.Status__c = 'Rejected';
        member.Comment__c = 'Reason';

        Boolean errorCaught = false;
        try{insert member;}
        catch(Exception e){
            errorCaught=true;
        }
        System.assert(!errorCaught);
        Webinar_member__c memberInserted = [SELECT Status__c, Comment__c FROM Webinar_member__c];
        System.assert(memberInserted.Comment__c == 'Reason', 'Comment erased for no reason');
    }
}