/**
 * Created by zjankowski on 14.10.2021.
 */

@IsTest
private class AC101_test {
    @IsTest
    static void testBehavior() {
        System.assert(AC101.picklistValues(Opportunity.StageName).size()>0);

    }

    @IsTest
    static void testMerging() {
        Account a = new Account();
        Account b = new Account();
        a.Name = 'Shrek';
        b.Name = 'Fiona';
        b.ShippingCountry = 'Poland';

        Account c = (Account)AC101.mergeObjects(a,b);

        System.assert(c.Name == 'Shrek');
        System.assert(c.ShippingCountry == 'Poland');
    }
}