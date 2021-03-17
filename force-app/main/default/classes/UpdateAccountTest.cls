@isTest

private class UpdateAccountTest {

   @isTest static void testnoAnnualRevenue(){
       Account a = new Account(Name = 'Test Account');
       insert a;

       Test.startTest();
       UpdateAccount.updatePriority();
       Test.stopTest();

       Integer UpdateAccount = [SELECT COUNT()  FROM Account
                                WHERE CustomerPriority__c = 'High'
                                OR CustomerPriority__c = 'Medium'
                                OR CustomerPriority__c = 'Low'];

        System.assertEquals(0, UpdateAccount);
   }
   // test for the account if over 800 million 

   @isTest static void testHighPriority(){
    Account a = new Account(Name = 'Test Account', AnnualRevenue = 800000000);
    insert a;
    
    Test.startTest();
    UpdateAccount.updatePriority();
    Test.stopTest();
    Integer UpdateAccount = [SELECT COUNT()  FROM Account
    WHERE CustomerPriority__c = 'High'];

    System.assertEquals(1, UpdateAccount);
   }

   @isTest static void testMediumPriority(){
    Account a = new Account(Name = 'Test Account 2', AnnualRevenue = 1000000);
    insert a;
    
    Test.startTest();
    UpdateAccount.updatePriority();
    Test.stopTest();
    Integer UpdateAccount = [SELECT COUNT()  FROM Account
    WHERE CustomerPriority__c = 'Medium'];

    System.assertEquals(2, UpdateAccount);
   }
   //test the low priority 
   @isTest static void testLowPriority(){
    Account a = [SELECT Name, AnnualRevenue 
                            FROM Account
                            WHERE Name LIKE 'Test Account%' and AnnualRevenue < 200000000 LIMIT 1];
    
    
    Test.startTest();
    UpdateAccount.updatePriority(a);
    Test.stopTest();

    System.assertEquals(a.CustomerPriority__c , 'Low', 'Error customer priority less the 200M');
   }


   @isTest static void testAnnualRevenueMultiple(){
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 10; i ++){
            Account a = new Account(Name = 'Test Account' + i);
            accounts.add(a);
        }
        insert accounts;
        Test.startTest();
        UpdateAccount.updatePriority();
        Test.stopTest();

        Integer UpdateAccount = [SELECT COUNT()  FROM Account
                                WHERE CustomerPriority__c = 'High'
                                OR CustomerPriority__c = 'Medium'
                                OR CustomerPriority__c = 'Low'];

System.assertEquals(0, UpdateAccount);

   }
}
