public class EmployeeNumberMod {

    public static void roundDown(){

        // list of the accounts 
        List<Account> accts = [SELECT Id, NumberOfEmployees FROM Account];
        Integer i = 0;

        while (i < accts.size()){
            // to make sure account doesnt have negative emoployee
            if (accts[i].NumberOfEmployees >= 0){

                Integer value = Math.mod(accts[i].NumberOfEmployees, 50);

                // subtracting the no of employees by the  mod value to make it even 

                accts[i].NumberOfEmployees -= value;
            }
            i++;
        }
        update accts;

    }
}