class Item < ApplicationRecord
    # soft delete from the DB
    def soft_delete
        update(deleted_at: Time.current)
    end

    # restore the item back into the DB
    def restore
        update(deleted_at: nil)
    end

    # default scope excludes deleted items
    default_scope { where(deleted_at: nil) }
end
