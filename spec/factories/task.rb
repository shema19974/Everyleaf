FactoryBot.define do

    # Name the test data to be created "task"
    # (If you name test data that matches the class name that actually exists, test data of that class will be created automatically)
    factory :task do
      title { 'Student' }
      content { 'Is a good student' }
    end
  
    # Name the test data to be created as "second_task"
    # (If you want to name a non-existent class name, optionally specify "Please make test data of this class")
    factory :second_task, class: Task do
      title { 'Accountant' }
      content { 'Balance money' }
    end
  end