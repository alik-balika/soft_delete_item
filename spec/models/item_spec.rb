
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Soft Delete Functionality' do
    let(:item) { Item.create(name: 'Test Item') }

    it 'soft deletes an item' do
      item.soft_delete
      expect(item.deleted_at).to_not be_nil
    end

    it 'restores a soft-deleted item' do
      item.soft_delete
      item.restore
      expect(item.deleted_at).to be_nil
    end

    it 'excludes soft-deleted items from normal queries' do
      soft_deleted_item = Item.create(name: 'Soft Deleted Item')
      soft_deleted_item.soft_delete

      # Soft deleted items should be excluded by default scope
      expect(Item.all).not_to include(soft_deleted_item)
    end
  end
end
