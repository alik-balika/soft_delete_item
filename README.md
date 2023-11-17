## Setting Up and Running the Code

### Prerequisites

Before running the code and tests, please make you have the following installed:

- Ruby (version 3.2.2)
- Ruby on Rails (version 7.1.2)
- SQLite3 database

### Installation Steps

1. Clone this repository:
    ```bash
    git clone https://github.com/alik-balika/soft_delete_item.git
    cd soft_delete_item
    ```

2. Install dependencies:
    ```bash
    bundle install
    ```

3. Run database migrations:
    ```bash
    rails db:migrate
    ```

### Running Tests

#### Running RSpec tests:
```bash
bundle exec rspec
```
Note, I find that this sometimes doesn't work for me and will output a message about 
a pending migration. In order to fix this, you can run the following command:
```bash
rails db:environment:set RAILS_ENV=test db:migrate
```

#### Manually Testing Soft Delete Functionality with Rails Console

1. Access the Rails Console:
    Run the following command to open the Rails console:
    ```bash
    rails console
    ```

2. Test Soft Deletion
    - Create several items using the following commands:
    ```bash
    item1 = Item.create(name: 'item 1')
    item2 = Item.create(name: 'item 2')
    item3 = Item.create(name: 'item 3')
    ```

    - Call the all method on the Item model to view all the items (Note that all 3 are present):
    ```bash
    Item.all
    ```

    - Soft delete one of the items:
    ```bash
    item1.soft_delete
    ```

    - Call the all method again (Note that only 2 are present):
    ```bash
    Item.all
    ```
3. Test Restoration
    - Restore the item that was deleted before:
    ```bash
    item1.restore
    ```

    - Call the all method again (Note that there are 3 items again):
    ```bash
    Item.all
    ```

### Summary of Soft Delete Functionality

The `Item` model in this project incorporates soft delete functionality. Here's a summary:

- **Model Creation:** Created an `Item` model with attributes `name` (string) and `deleted_at` (datetime).
- **Soft Delete Implementation:**
  - Added `soft_delete` method that updates the `deleted_at` attribute with the current timestamp.
  - Added `restore` method that sets the `deleted_at` attribute to `nil`.
- **Default Scope:** Included a default scope in the `Item` model to exclude "deleted" items from normal queries.
- **Testing:** Implemented RSpec tests to ensure the functionality works as expected, covering soft delete, restoration, and exclusion from queries.
