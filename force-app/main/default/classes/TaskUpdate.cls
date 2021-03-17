public class TaskUpdate {
    public static void createTasks( Account acct){
        // list created to add tasks
        List<Task> accountTasks = new List<Task>();

        Task a = new Task(Subject = 'Feature call ', Priority = 'High', Status =  'Not started', WhatId = acct.Id);
        Task b = new Task(Subject = 'Follow up 1 ', Priority = 'Normal', Status =  'Not started', WhatId = acct.Id);
        Task c = new Task(Subject = 'Follow up 2 ', Priority = 'Normal', Status =  'Not started', WhatId = acct.Id);
        
        // adding all task to the account
        accountTasks.add(a);
        accountTasks.add(b);
        accountTasks.add(c);

        // assigning the task to an account
        Integer featureTasks = [SELECT COUNT() FROM Task WHERE WhatId = :acct.Id AND Subject = 'Feature Call'];
        Integer followUp1Tasks  = [SELECT COUNT() FROM Task WHERE WhatId = :acct.Id AND Subject = 'Follow up 1'];
        Integer followUp2Tasks  = [SELECT COUNT() FROM Task WHERE WhatId = :acct.Id AND Subject = 'Follow up 2'];

        if(featureTasks > 0){
            accountTasks.remove(accountTasks.indexOf(a));

        }
        if(followUp1Tasks > 0 ){
            accountTasks.remove(accountTasks.indexOf(b));
        }

        if (followUp2Tasks > 0){
            accountTasks.remove(accountTasks.indexOf(c));
        }
        // add the task to the account 

        if (accountTasks.size() > 0){
            
            insert accountTasks;
        }



    }

}
