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
    bin/rails db:migrate
    ```

### Running Tests

To run RSpec tests:
```bash
bundle exec rspec
```

### Summary of Soft Delete Functionality

The `Item` model in this project incorporates soft delete functionality. Here's a summary:

- **Model Creation:** Created an `Item` model with attributes `name` (string) and `deleted_at` (datetime).
- **Soft Delete Implementation:**
  - Added `soft_delete` method that updates the `deleted_at` attribute with the current timestamp.
  - Added `restore` method that sets the `deleted_at` attribute to `nil`.
- **Default Scope:** Included a default scope in the `Item` model to exclude "deleted" items from normal queries.
- **Testing:** Implemented RSpec tests to ensure the functionality works as expected, covering soft delete, restoration, and exclusion from queries.
