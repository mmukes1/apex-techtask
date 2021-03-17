public  inherited sharing  class AccountUtils { 
    //Using the list, generate a method
public static List<Id> createAcc(List<String> AccNames){ 
 //list to hold the Ids of the new accounts 
              List<Id> accountId = new List<Id>(); 
              //list that will hold the new accounts 
            List<Account> accounts = new List<Account>();
               // to check the duplicate accounts 
               try {
                   for (Integer i = 0; i < AccNames.size(); i ++){
                       String name = AccNames[i];

                       for (Integer j = 0 ; j < AccNames.SIZE(); j++){
                           if (j != 1){
                               if (AccNames[j].equals(name)){
                                   AccNames.remove(j);
                               }

                           }
                       }
                   }
               
        for(String name : AccNames){
            Account account = new Account(Name = name);
            accounts.add(account);
        }        
         //insert the list of accounts 
         
        insert accounts;
      //  loop through the list and add the account Ids 
      for(Account account : accounts){
          Id accountIds = account.Id;
          accountId.add(accountIds);
      }
    }
    // catch the exception 
    catch (Exception e){
        System.debug('The account not working ');
    }
      return accountId;

        
} 
}