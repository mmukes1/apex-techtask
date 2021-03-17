@isTest

private class AccountUtilsTest{

    @isTest static void  testCreatezeroAccounts(){
        List<String>  AccNames;

        Test.startTest();
        List<Id> accountId = AccountUtils.createAcc(AccNames);
        Test.stopTest();

        System.assertEquals(0, accountId.size());

    }
    @isTest static void testCreatezeroAccounts2(){
        List<String> AccNames = new List<String>();
        AccNames.add('');

        Test.startTest();
        List<Id> accountId = AccountUtils.createAcc(AccNames);
        Test.stopTest();

        System.assertEquals(0, accountId.size());

    }
    @isTest static void testcreateOneAccount(){
        List<String> AccNames = new List<String>();
        AccNames.add('Test Account');

        Test.startTest();
        List<Id> accountId = AccountUtils.createAcc(AccNames);
        Test.stopTest();
        
        System.assertEquals(1, accountId.size());
        
    }
    @isTest static void testcreateTenAccounts(){
        List<String> AccNames = new List<String>();
        for(Integer i = 0; i < 10 ; i ++){
            AccNames.add('Test Account' + i);
        }
        Test.startTest();
        List<Id> accountId = AccountUtils.createAcc(AccNames);
        Test.stopTest();

        System.assertEquals(10, accountId.size());

    }
}