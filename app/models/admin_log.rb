class AdminLog < ApplicationRecord

  belongs_to :admin_user

  enum target: ['用户', '物品']
  enum action: ['新增', '编辑', '删除']

  def self.add(data)
    case data[:target]
    when :user
      data[:target] = targets['用户']
    else
      data[:target] = targets['物品']
    end

    case data[:action]
    when :new
      data[:action] = actions['新增']
    when :edit
      data[:action] = actions['编辑']
    else
      data[:action] = actions['删除']
    end

    create!(data)
  end
end
