class Pagy
  module Backend
    private

    # Return Pagy object and items
    def pagy(collection, vars = {})
      pagy = Pagy.new(pagy_get_vars(collection, vars))
      [pagy, pagy_get_items(collection, pagy)]
    end

    # Sub-method called only by #pagy: here for easy customization of variables by overriding
    def pagy_get_vars(collection, vars)
      ## Override to fixed issues with mongoid
      pagy_set_items_from_params(vars) if defined?(UseItemsExtra)
      vars[:count] ||= (c = collection.all.count).is_a?(Hash) ? c.size : c
      vars[:page]  ||= params[vars[:page_param] || VARS[:page_param]]
      vars
    end

    # Sub-method called only by #pagy: here for easy customization of record-extraction by overriding
    def pagy_get_items(collection, pagy)
      # This should work with ActiveRecord, Sequel, Mongoid...
      collection.offset(pagy.offset).limit(pagy.items)
    end
  end
end
