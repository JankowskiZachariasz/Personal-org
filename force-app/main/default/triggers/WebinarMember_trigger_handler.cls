/**
 * Created by zjankowski on 19.10.2021.
 */

public with sharing class WebinarMember_trigger_handler {

    public static void ensureCommentForRejected(list<Webinar_member__c> webinarMembers){
        for(Webinar_member__c member :webinarMembers ){
            if(member.Status__c=='Rejected' && (member.Comment__c=='' || member.Comment__c==null)){
                member.addError('Provide a comment for rejected users');
            }
        }
    }
}