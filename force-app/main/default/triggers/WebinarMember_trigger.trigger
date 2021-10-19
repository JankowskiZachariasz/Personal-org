/**
 * Created by zjankowski on 19.10.2021.
 */

trigger WebinarMember_trigger on Webinar_member__c (before insert, before update, after insert, after update) {

    if(System.Trigger.isInsert || System.Trigger.isUpdate){
        if(System.Trigger.isBefore){
            WebinarMember_trigger_handler.ensureCommentForRejected(System.Trigger.new);
        }

    }
}