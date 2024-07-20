from models.branch import branch
from models.category import category
from models.inventory_model import inventory
from models.outgoing_stock import outgoing_stock
from models.sale_weekly import sale_weekly
from models.user import user

# Create user instances
user1 = user(name='Ashimwe_Geoffrey', access_control='Administrator', email='ashimwegeoffrey@gmail.com')
user2 = user(name='Muvunyi_Jimmy', access_control='Sale_Manager', email='muvunyijdieu1@gmail.com')
user3 = user(name='Sibomana_Eugene', access_control='Auditor', email='sibomanaeugene69@gmail.com')

# Create branch instances
branch1 = branch(branch_name='Town')
branch2 = branch(branch_name='Csk')
branch3 = branch(branch_name='Eto_Gesi')

# Create category instances
category1 = category(name='General', percentage='0%')
category2 = category(name='Football', percentage='0%')
category3 = category(name='Basketball', percentage='0%')
category4 = category(name='Volleyball', percentage='0%')
category5 = category(name='Tennis', percentage='0%')
category6 = category(name='Swimming', percentage='0%')
category7 = category(name='General Mechanics', percentage='0%')
category8 = category(name='Bag', percentage='0%')
category9 = category(name='Shoes', percentage='0%')
category10 = category(name='General Clothes', percentage='0%')
category11 = category(name='Basic needs', percentage='0%')

# Save the new users
user1.save()
user2.save()
user3.save()

# Save the new branches
branch1.save()
branch2.save()
branch3.save()

# Save the new categories
category1.save()
category2.save()
category3.save()
category4.save()
category5.save()
category6.save()
category7.save()
category8.save()
category9.save()
category10.save()
category11.save()
