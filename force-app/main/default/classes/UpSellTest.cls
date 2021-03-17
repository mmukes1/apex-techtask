@isTest

private class UpSellTest {
    @isTest static void testNoSLABulk() {
        List<Account> testaccounts = new List<Account>();
        for(Integer i = 0; i < 150 ; i++){
            Account a = new Account(Name ='Test Accounts' + i);
            testaccounts.add(a);
        }
        insert testaccounts;

        Test.startTest();
        UpSell.createOpps();
        Test.stopTest();

        List<Opportunity> opps = [SELECT Id  FROM Opportunity WHERE (AccountId IN (SELECT Id FROM Account WHERE SLA__c = null)) AND Name LIKE '%SLA Upsell - Bronze'];
         
        System.assertEquals(150, opps.size());

    }
}