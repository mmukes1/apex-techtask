
public class UpSell {

    public static void createOpps() {

        // list of opportunities to add
        List<Opportunity> opps = new List<Opportunity>();

        // condition check

        for(Account a: [SELECT id, Name, SLA__c,(SELECT Id, Name FROM Opportunities) FROM  Account]){

            // make sure  the account is valid 
            if(!String.isBlank(a.Name)){
                
                switch on a.SLA__c{
                    when 'Bronze'{
                        // creating a silver upsell for bronze account
                        Opportunity op = new Opportunity(
                            Name = a.Name + 'SLA Upsel - Silver',
                            StageName = 'Prospecting',
                            CloseDate= Date.today().addMonths(1),
                            AccountId = a.Id

                        );
                        opps.add(op);
                    }
                    when 'Silver' {
                        // creating gold for silver account 
                        Opportunity op = new Opportunity(
                            Name = a.Name + 'SLA Upsel - Gold',
                            StageName = 'Prospecting',
                            CloseDate= Date.today().addMonths(1),
                            AccountId = a.Id

                        );
                        opps.add(op);
                    }
                    when 'Platinum' {
                        // do nothing because it is already on the top level
                    }
                    when else {
                        // bronze upsell with no SLA 
                            Opportunity op = new Opportunity(
                                Name = a.Name + 'SLA Upsel - Bronze',
                                StageName = 'Prospecting',
                                CloseDate= Date.today().addMonths(1),
                                AccountId = a.Id
    
                            );
                            opps.add(op);
                    }
                
                }
             } else {
                    System.debug('Account' + a.Id + 'it is not valid account ');
                }
            
        }
        insert opps;
    }
}