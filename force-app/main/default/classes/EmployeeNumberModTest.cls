@isTest

private class EmployeeNumberModTest {
    @isTest static void testOneRecord() {
        List<Account> testAccts =  new List<Account>();
        for(Integer i = 0; i < 1; i++) {
            Account a =  new Account(Name ='Test account' + i , NumberOfEmployees = 102);
            testAccts.add(a);
        }
        insert testAccts;

        Test.startTest();
        EmployeeNumberMod.roundDown();
        Test.stopTest();

        Account a = [SELECT NumberOfEmployees FROM Account LIMIT 1];
        System.assertEquals(100, a.NumberOfEmployees);
    }

    @isTest static void testMultipleAccount(){
        List<Account> testAccts =  new List<Account>();
        for(Integer i = 0; i < 10; i++) {
            Account a =  new Account(Name ='Test account' + i , NumberOfEmployees = 91);
            testAccts.add(a);
        }
        insert testAccts;

        Test.startTest();
        EmployeeNumberMod.roundDown();
        Test.stopTest();

        Account a = [SELECT NumberOfEmployees FROM Account LIMIT 1];
        System.assertEquals(50, a.NumberOfEmployees);
    }

    
}