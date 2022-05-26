class Notification < ApplicationRecord
  belongs_to :receiver, :class_name => "User"
  belongs_to :order
  belongs_to :sender, :class_name => "User"

  enum category: [:invite, :accepte]

  # This method is for testing and debugging only
  def self.create(sender_id, receiver_id, category)
    new_notification = Notification.new
    new_notification.receiver_id = receiver_id
    new_notification.category = category
    new_notification.order_id = 1
    new_notification.sender_id = sender_id
    new_notification.viewed = false
    new_notification.save()
    data = {
      :notification_id => new_notification.id,
      :receiver => new_notification.receiver,
      :category => category,
      :order => new_notification.order,
      :sender => new_notification.sender,
      :viewed => new_notification.viewed
    }
    puts data
    ActionCable.server.broadcast("notification_channel_#{receiver_id}", data)   # notification_channel_user_id
  end

  def self.notify_invite(order_friend)
    new_notification = Notification.new
    new_notification.receiver_id = User.find_by(email: order_friend.friend.email).id
    new_notification.category = 0
    new_notification.order_id = order_friend.order.id
    new_notification.sender_id = order_friend.order.user.id
    new_notification.viewed = false
    new_notification.save()
    data = {
      :notification_id => new_notification.id,
      :receiver => new_notification.receiver,
      :category => new_notification.category,
      :order => new_notification.order,
      :sender => new_notification.sender,
      :viewed => new_notification.viewed
    }
    puts data
    ActionCable.server.broadcast("notification_channel_#{new_notification.receiver_id}", data)   # notification_channel_user_id
  end

  def self.notify_accept(order, user_who_accepted)
    new_notification = Notification.new
    new_notification.receiver_id = order.user.id
    new_notification.category = 1
    new_notification.order_id = order.id
    new_notification.sender_id = user_who_accepted.id
    new_notification.viewed = false
    new_notification.save()
    data = {
      :notification_id => new_notification.id,
      :receiver => new_notification.receiver,
      :category => new_notification.category,
      :order => new_notification.order,
      :sender => new_notification.sender,
      :viewed => new_notification.viewed
    }
    puts data
    ActionCable.server.broadcast("notification_channel_#{new_notification.receiver_id}", data)   # notification_channel_user_id
  end

end
