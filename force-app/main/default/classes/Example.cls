/**
 * Created by zjankowski on 14.10.2021.
 */

public with sharing class Example {

    public static void AC100_1(){

        List<List<SObject>> searchList = [FIND '"SFDC" OR "Wingo"' IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName, Department)];
        System.debug('The size of this array is: '+ searchList.size());
        for(List<SObject> obj : searchList){
            System.debug(obj);
        }

    }

    public static void AC100_2(){

        List<Case> cases = [SELECT Id From Case WHERE Status != 'Closed'];

        System.debug('The size of this array is: '+ cases.size());

    }


    public static void AC100_3(){

        List<Case> cases = [SELECT Contact.FirstName, Account.Name, Subject From Case WHERE Status = 'Closed'];

        System.debug('The size of this array is: '+ cases.size());
        for(Case obj : cases){
            System.debug(obj.Account.Name+' '+obj.Contact.FirstName+' '+obj.Subject);
        }

    }

    public static void AC100_4(){

        List<Contact> conts = [SELECT FirstName, LastName, Id,MailingAddress  From Contact WHERE MailingCountry LIKE 'USA'];

        System.debug('The size of this array is: '+ conts.size());
        for(Contact obj : conts){
            System.debug(obj.FirstName+', '+obj.LastName+' '+obj.MailingAddress.getCountry());
        }

    }

    public static void AC100_5(){

        List<Opportunity> opps = [SELECT Name From Opportunity WHERE StageName = 'Closed Won'];

        System.debug('The size of this array is: '+ opps.size());
        for(Opportunity obj : opps){
            System.debug(obj.Name);
        }

    }

    public static void AC100_6(){

        List<Opportunity> opps = [SELECT Name From Opportunity ORDER BY Amount DESC limit 10];

        System.debug('The size of this array is: '+ opps.size());
        for(Opportunity obj : opps){
            System.debug(obj.Name);
        }

    }

    public static void AC100_8(){

        Integer count = [SELECT COUNT() From Opportunity WHERE Amount > 100000 AND Amount < 500000];
        System.debug('The size of this array is: '+ count);

    }

}