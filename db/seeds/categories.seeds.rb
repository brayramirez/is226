categories = ['Office Supplies',
              'Computers',
              'Gadgets',
              'Electronics',
              'Books',
              'Groceries']

categories.each { |category| Category.create :name => category }