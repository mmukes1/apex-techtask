@isTest

private class TaskUpdateTest {


// task should assigned to pass through an account 
@isTest static void testTaskOnOneAccount (){
    Account a = new Account(Name = 'Test 1');
    Account b = new Account(Name = 'Test 2');

    insert a;
    insert b;

    Test.startTest();
    TaskUpdate.createTasks(a);
    test.stopTest();

    List<Task> tasks = [SELECT Id FROM task WHERE WhatId = :b.Id];

    System.assertEquals(0, tasks.size());
}

// check if the task is already there and dont make it 
@isTest static void testAccountAlreadyhadTasks (){
    Account a = new Account(Name = 'Test 1');
    

    insert a;
   

    Test.startTest();
    TaskUpdate.createTasks(a);
    TaskUpdate.createTasks(a);
    test.stopTest();

    List<Task> tasks = [SELECT Id FROM task WHERE WhatId = :a.Id];

    System.assertEquals(3, tasks.size());
}

}