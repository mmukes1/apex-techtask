
public class Upsell {

    public static void createOpps() {

        // list of opportunities to add
        List<Opportunity> opps = new List<Opportunity>();

        // condition check

        for(Account a: [SELECT id, Name, SLA__c,(SELECT Id, Name FROM Opportunities) FROM  Account]){

            // make sure  the account is valid 
            if(!String.isBlank(a.Name)){
                
                switch on a.SLA__c{
                    when 'Bronze'{
                        Opportunity op = new Opportunity(
                            Name = a.Name + 

                        );
                    }
                }
            }
        }
    }
}