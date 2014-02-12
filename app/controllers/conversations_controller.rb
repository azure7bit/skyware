class ConversationsController < ApplicationController
  before_filter :authenticate_super_admin!
  helper_method :mailbox, :conversation

  def index
    current_super_admin.mailbox
    respond_to do |format|
      format.html
    end
  end

  def new
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    end
    Conversation.new
    respond_to do |format|
      format.html
    end
  end

  def show
    Conversation.find_by_id(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def create
    recipient_emails = conversation_params(:recipients).split(',')
    recipients = SuperAdmin.where(email: recipient_emails).all

    conversation = current_super_admin.
      send_message(recipients, *conversation_params(:body, :subject)).conversation

    redirect_to conversation
  end

  def reply
    current_super_admin.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation
  end

  def trash
    conversation.move_to_trash(current_super_admin)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_super_admin)
    redirect_to :conversations
  end

  private

  def mailbox
    @mailbox ||= current_super_admin.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
end
