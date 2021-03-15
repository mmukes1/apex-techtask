@isTest

private class AccountUtilsTest{

    @isTest static void  testCreatezeroAccounts(){
        List<String>  AccNames;

        Test.startTest();
        List<Id> accountId = AccountUtils.createAcc(AccNames);
        Test.stopTest();

        System.assertEquals(0, accountId.size());

    }
}