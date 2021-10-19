/**
 * Created by zjankowski on 14.10.2021.
 */

public with sharing class AC101 {

    public static void AC101_1(){
        //this example just showed that you dont even have to retrieve a value
                List<Account> accs = [SELECT Id FROM Account WHERE Type = Null];
        for(Account obj : accs){
            obj.Type = 'Other';
        }
        update accs;
        System.debug(accs.size());
    }

    public static void AC101_1_5(){
        //this example just showed that you dont even have to retrieve a value
        List<Account> accs = [SELECT Id FROM Account WHERE Type = Null];
        for(Account obj : accs){
            obj.Type = 'Other';
        }
        update accs;
        System.debug(accs.size());
    }

    public static void AC101_2(){
        List<Account> accs = [SELECT Id FROM Account WHERE 	Rating = 'Warm'];
        for(Account obj : accs){
            obj.Rating = 'Hot';
        }
        update accs;
        System.debug(accs.size());
    }


    public static void AC101_4(){
        //All Accounts with Type ‘Customer – Direct’ have ‘Customer’ Record Type, the rest have a Record
        //Type “Business”

        List<Account> accs = [SELECT Id, Type FROM Account];
        for(Account obj : accs){
            if(obj.Type == 'Customer - Direct')
            obj.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Customer').getRecordTypeId();
            else
            obj.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        }
        update accs;
        System.debug(accs.size());
    }

    public static List<String> picklistValues( SObjectField field){

        Schema.DescribeFieldResult fieldResult = field.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        List<String> picklistValuesToReturn = new List<String>();
        for(Schema.PicklistEntry entry : ple){
            picklistValuesToReturn.add(entry.value);
        }
        System.debug(picklistValuesToReturn);
        return picklistValuesToReturn;
    }

    public static SObject mergeObjects (SObject master, SObject merging){


        Set<String> mergingList = merging.getPopulatedFieldsAsMap().keySet();

        for(String fieldName: mergingList){
            if(master.get(fieldName) == null){
                master.put(fieldName, merging.get(fieldName));
            }
        }

        return master;


    }


}