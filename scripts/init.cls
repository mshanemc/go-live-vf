account a = new Account();
a.Name = 'Visualforce Booth Account';
insert a;

Contract c = new Contract();
c.AccountId = a.id;
c.Status = 'Draft';
c.ContractTerm = 12;
c.StartDate = system.today().toStartOfMonth().addMonths(-1);
insert c;

Order o = new Order();
o.AccountId = a.Id;
o.ContractId = c.Id;
o.Status = 'Draft';
o.EffectiveDate = system.today();
insert o;


