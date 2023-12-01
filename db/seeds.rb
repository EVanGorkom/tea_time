customer1 = Customer.create(first_name: "Bob", last_name: "Dude", email: "123@gmail.com", address: "sesame street")
customer2 = Customer.create(first_name: "Sally", last_name: "Dude", email: "321@gmail.com", address: "sesame street")
customer3 = Customer.create(first_name: "Alex", last_name: "Dude", email: "abc@gmail.com", address: "sesame street")

bob_sub1 = Subscription.create(title: "Bob's Sub 1", price: 12, frequency: 3, customer_id: customer1.id)
bob_sub2 = Subscription.create(title: "Bob's Sub 2", price: 20, frequency: 3, customer_id: customer1.id)

sally_sub1 = Subscription.create(title: "Sally's Sub 1", price: 12, frequency: 3, customer_id: customer2.id)
sally_sub2 = Subscription.create(title: "Sally's Sub 2", price: 20, frequency: 3, customer_id: customer2.id)

alex_sub1 = Subscription.create(title: "Alex's Sub 1", price: 12, frequency: 3, customer_id: customer3.id)
alex_sub2 = Subscription.create(title: "Alex's Sub 2", price: 20, frequency: 3, customer_id: customer3.id)

tea1 = Tea.create(title: "Ghyshal Greens", description: "A nice herbal tea", temperature: 105, brew_time: 5)
tea2 = Tea.create(title: "Potion", description: "A basic black tea", temperature: 105, brew_time: 5)
tea3 = Tea.create(title: "Hi-Potion", description: "A relaxing tea", temperature: 105, brew_time: 5)
tea4 = Tea.create(title: "Elixir", description: "A refreshing balmy tea", temperature: 105, brew_time: 5)
tea5 = Tea.create(title: "Pheonix Down", description: "A restorative tea", temperature: 105, brew_time: 5)

TeaSubscription.create(subscription_id: bob_sub1.id, tea_id: tea1.id)
TeaSubscription.create(subscription_id: bob_sub1.id, tea_id: tea2.id)
TeaSubscription.create(subscription_id: bob_sub1.id, tea_id: tea3.id)
TeaSubscription.create(subscription_id: bob_sub2.id, tea_id: tea4.id)
TeaSubscription.create(subscription_id: bob_sub2.id, tea_id: tea5.id)

TeaSubscription.create(subscription_id: sally_sub1.id, tea_id: tea1.id)
TeaSubscription.create(subscription_id: sally_sub1.id, tea_id: tea2.id)
TeaSubscription.create(subscription_id: sally_sub1.id, tea_id: tea3.id)
TeaSubscription.create(subscription_id: sally_sub2.id, tea_id: tea3.id)
TeaSubscription.create(subscription_id: sally_sub2.id, tea_id: tea5.id)

TeaSubscription.create(subscription_id: alex_sub1.id, tea_id: tea1.id)
TeaSubscription.create(subscription_id: alex_sub1.id, tea_id: tea2.id)
TeaSubscription.create(subscription_id: alex_sub1.id, tea_id: tea3.id)
TeaSubscription.create(subscription_id: alex_sub2.id, tea_id: tea5.id)
TeaSubscription.create(subscription_id: alex_sub2.id, tea_id: tea1.id)
