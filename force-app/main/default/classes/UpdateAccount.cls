public class UpdateAccount {

    public static void updatePriority(){
        // list to store the updated accounts 
        List<Account> accounts = new List<Account>();
    
// getting the list of accounts in org depending upon the annual revenue 
    for (Account a : [SELECT Id, AnnualRevenue, CustomerPriority__c  FROM Account WHERE AnnualRevenue >= 0]) {
        if (a.AnnualRevenue > 800000000 ){
            a.customerPriority__c = 'High';
        } else if (a.AnnualRevenue < 200000000){
            a.customerPriority__c = 'Low';
        } else {
            a.customerPriority__c = 'Medium';
        }
        accounts.add(a);
        }
        update accounts;
    }

}
